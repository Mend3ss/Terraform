locals {
  prefix = "sentinel-${var.environment}"

  tags = {
    Environment = var.environment
    Project     = "Sentinel-Linux-Lab"
    ManagedBy   = "Terraform"
  }
}