# ☁️ AWS Cloud Infrastructure: Secure RDS Provisioning

## 👁️ Architecture Overview
This repository contains **Infrastructure as Code (IaC)** using **HashiCorp Terraform** to provision a secure, production-ready PostgreSQL database on **AWS (Amazon Web Services)**. 

## ⚙️ Tech Stack
- **Cloud Provider:** AWS (RDS, EC2, VPC)
- **IaC Tool:** Terraform
- **Database:** PostgreSQL 14
- **Security:** AWS Security Groups, IAM, Sensitive Variables

## 🩸 Business Value & Problem Statement
Manual cloud provisioning leads to human error, security vulnerabilities, and untrackable costs. By defining infrastructure as code:
1. **Disaster Recovery:** If the database goes down, the exact same infrastructure can be redeployed in minutes with a single `terraform apply`.
2. **Security by Default:** The RDS instance is deployed in a private subnet (`publicly_accessible = false`) with strict Security Group rules, preventing external brute-force attacks.
3. **Cost Optimization:** Infrastructure can be easily spun up for testing and destroyed (`terraform destroy`) to avoid idle AWS billing.

## 🚀 How to Use
1. Initialize Terraform:
   `terraform init`
2. Review the execution plan:
   `terraform plan -var="db_username=admin" -var="db_password=securepassword"`
3. Deploy to AWS:
   `terraform apply`
