// 리전
variable "region" {
  description = "region"
  type        = string
}


// tag 및 리소스 이름 구성에 사용됨
variable "environment" {
  description = "environment info. (e.g: prod, dev, stage, test)"
  type        = string
}


// 서버명 (server_name-environment 형태로 구성됩니다.)
variable "server_name" {
  description = "The name of the server machine you want to create."
  type        = string
}

// 로그 삭제 대기일수. (14=14일, 0=삭제하지않음)
variable "log_retention_in_days" {
  description = "The name of the server machine you want to create."
  type        = number
  default     = 0
}

// 컨테이너 포트포워딩 설정입니다.
// portforward_host_port를 1000, portforward_container_port를 2000으로 하면 1000->2000으로 포워딩됩니다.
variable "portforward_host_port" {
  description = "host port"
  type        = number
  default     = 80
}

// 컨테이너 포트포워딩 설정입니다.
variable "portforward_container_port" {
  description = "container port"
  type        = number
  default     = 80
}

// 배포에 사용할 docker 태그입니다. 
variable "docker_release_tag" {
  description = "value of docker release tag. (e.g: latest, 1.0.0, 1.0.0-rc1)"
  type        = string
  default     = "latest"
}

# variable "github_repository" {
#   description = "The name of the github repository."
#   type        = string
# }

# variable "github_branch" {
#   description = "The name of the github branch."
#   type        = string
# }

# variable "github_oauth_token" {
#   description = "The oauth token for github. (e.g: ghp_KZymx3mI6f3x*****5GN3W5RItAB1fzlyi)"
#   type        = string
# }

# variable "vpc_id" {
#   description = "VPC ID. That VPC must have at least 2 subnets for availability. (e.g: vpc-053f9aaabecf3b6bc)"
#   type        = string
# }

# variable "subnet_ids" {
#   description = "Subnet IDs. (e.g: [subnet-0a9b8c7d6e5f4a3b2, subnet-0a9b8c7d6e5f4a3b2])"
#   type        = list(string)
# }
# variable "certificate_arn" {
#   description = "The ARN of the certificate to use for SSL. (e.g: arn:aws:acm:ap-northeast-2:210706881319:certificate/6a0b3a8b-bcb1-491d-a814-078739105983)"
#   type        = string
# }

variable "docker_entrypoint" {
  description = "The entrypoint of the docker image. (e.g: \"sh\", \"run.sh\")"
  type        = string
}

# variable "healthcheck_uri" {
#   description = "The uri of the healthcheck. (e.g: \"/health\")"
#   type        = string
# }

# variable "buildspec_path" {
#   description = "BuildSpec file path (e.g: \"/prod/buildspec.yml\")"
#   type        = string
# }

variable "container_memory" {
  description = "The memory of the container. (e.g: 2048)"
  type        = number
  default     = 2048
}

variable "container_cpu" {
  description = "The cpu of the container. (e.g: 1024)"
  type        = number
  default     = 1024
}
