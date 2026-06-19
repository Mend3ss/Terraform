terraform {
  backend "s3" {
    bucket = "joaomendes3822-bucket-lab"
    key    = "Prod/terraform.tfstate"
    region = "us-east-1"
  }
}