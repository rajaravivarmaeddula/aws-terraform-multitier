variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region where resources will be deployed."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base CIDR block for the custom VPC."
}
