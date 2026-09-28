# Automated Multi-Tier AWS Infrastructure using Terraform

## Overview
Automated Infrastructure as Code (IaC) written in **Terraform** to provision a high-availability, multi-tier web application architecture on AWS.

## Architecture & Security Highlights
- **VPC Networking:** Custom `/16` CIDR block distributed across two distinct Availability Zones for High Availability.
- **Security Group Chaining:** Enforced zero-trust perimeter security by restricting web instance HTTP access exclusively to traffic coming from the Application Load Balancer (ALB).
- **Dynamic Data Sources:** Queried AWS APIs dynamically for free-tier eligible AMIs and availability zone names instead of hardcoding region-specific IDs.
- **Automated Bootstrapping:** Utilized EC2 User Data scripts to initialize web servers upon spin-up.

## Deployment Steps
1. Initialize Terraform:
   `terraform init`
2. Deploy Infrastructure:
   `terraform apply -auto-approve`
3. Destroy Resources:
   `terraform destroy -auto-approve`
