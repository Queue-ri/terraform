terraform {
  required_providers {
    # 일종의 라이브러리 로드
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

// Batch 컴퓨팅 환경
resource "aws_batch_compute_environment" "compute_env" {
  compute_environment_name = local.resource_id

  compute_resources {
    max_vcpus = var.max_vcpu

    security_group_ids = [
      aws_security_group.batch_security_group.id
    ]

    subnets = var.subnet_ids
    type    = "FARGATE"
  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"
}

// Batch 작업 큐
resource "aws_batch_job_queue" "job_queue" {
  name     = local.resource_id
  state    = "ENABLED"
  priority = 1

  compute_environments = [
    aws_batch_compute_environment.compute_env.arn,
  ]
}

// ECR
// 서버 프로지버닝에 사용할 docker image를 관리합니다.
resource "aws_ecr_repository" "ecr" {
  name                 = local.resource_id
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = local.tags
}

// ECS 
// 서버를 배포할 ECS 클러스터입니다. 
resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.resource_id

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = local.tags
}

// Batch 작업 정의
resource "aws_batch_job_definition" "task_definition" {
  name = "test"
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = jsonencode({
    command = ["ls", "-la"],
    image   = join(":", [aws_ecr_repository.ecr.repository_url, "latest"])

    resourceRequirements = [
      {
        type  = "VCPU"
        value = "0.25"
      },
      {
        type  = "MEMORY"
        value = "512"
      }
    ]


    environment = [
      {
        name  = "Key"
        value = "Value"
      }
    ]

    executionRoleArn = aws_iam_role.task_execution_role.arn
  })

  tags = local.tags
}
