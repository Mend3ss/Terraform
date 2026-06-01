project_name = "myapp"
environment  = "dev"
aws_region   = "us-east-1"

container_image = "nginx:latest"
container_port  = 80

task_cpu    = 256
task_memory = 512

service_desired_count = 2
autoscaling_min       = 1
autoscaling_max       = 4
