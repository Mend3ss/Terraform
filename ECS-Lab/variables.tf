variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "myapp"
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Networking
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

# ECS / Container
variable "container_image" {
  type        = string
  default     = "joaomendes3822/my-go-app"
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8000
}

variable "container_env_vars" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "task_cpu" {
  description = "Fargate task CPU units (256, 512, 1024, 2048, 4096)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Fargate task memory in MiB"
  type        = number
  default     = 512
}

variable "service_desired_count" {
  description = "Number of task instances to run"
  type        = number
  default     = 2
}

# Health check
variable "health_check_path" {
  description = "ALB health check path"
  type        = string
  default     = "/leo"
}

# Auto Scaling
variable "autoscaling_min" {
  description = "Minimum number of ECS tasks"
  type        = number
  default     = 1
}

variable "autoscaling_max" {
  description = "Maximum number of ECS tasks"
  type        = number
  default     = 4
}

# RDS
variable "db_name" {
  description = "Database name"
  type        = string
  default     = "root"
}

variable "db_username" {
  description = "Master username for the RDS database"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
  default     = "rootroot"
}

variable "db_port" {
  description = "Port for the database"
  type        = number
  default     = 54321
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance (GB)"
  type        = number
  default     = 10
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "16"
}