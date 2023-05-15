// 리전
variable "region" {
  description = "region"
  type        = string
}

// 서버 구성에 사용할 VPC입니다.
variable "vpc_id" {
  description = "VPC ID. That VPC must have at least 2 subnets for availability. (e.g: vpc-053f9aaabecf3b6bc)"
  type        = string
}

// tag 및 리소스 이름 구성에 사용됨
variable "environment" {
  description = "environment info. (e.g: prod, dev, stage, test)"
  type        = string
}

// 서버명 (server_name-environment 형태로 구성됩니다.)
variable "system_name" {
  description = "The name of the system"
  type        = string
}

variable "max_vcpu" {
  description = "max vcpu"
  type        = number
  default     = 16
}

variable "github_user" {
  description = "The username of the github repository."
  type        = string
}

variable "github_repository" {
  description = "The name of the github repository."
  type        = string
}

variable "github_branch" {
  description = "The name of the github branch."
  type        = string
}

variable "codestar_arn" {
  description = "CodeStarConnection ARN"
  type        = string
}

// 서브넷 목록
variable "subnet_ids" {
  description = "Subnet IDs. (e.g: [subnet-0a9b8c7d6e5f4a3b2, subnet-0a9b8c7d6e5f4a3b2])"
  type        = list(string)
}

// docker container entrypoint
variable "docker_entrypoint" {
  description = "The entrypoint of the docker image. (e.g: \"sh\", \"run.sh\")"
  type        = list(string)
  default     = ["sh", "run.sh"]
}

// 빌드에 사용할 buildspec.yml 위치입니다.
variable "buildspec_path" {
  description = "BuildSpec file path (e.g: \"/prod/buildspec.yml\")"
  type        = string
  default     = "buildspec.yml"
}

// 컨테이너 메모리입니다. 메가바이트 단위입니다.
variable "container_memory" {
  description = "The memory of the container. It is in megabytes. (e.g: 2048)"
  type        = string
  default     = "2048"
}

// 컨테이너에 할당할 vcpu 개수입니다. 1024가 1vcpu입니다.
variable "container_cpu" {
  description = "The cpu of the container. 1024 is one vcpu. (e.g: 1024)"
  type        = string
  default     = "1024"
}

// code build 컴퓨팅 타입입니다.
// 다음 문서를 참고합니다. https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html
variable "codebuild_compute_type" {
  description = "The compute type of the codebuild. (e.g: BUILD_GENERAL1_SMALL)"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}
