# Infrastructure as Code (IaC) for Core Cloud Resources

## Project Overview

This project demonstrates Infrastructure as Code (IaC) implementation using Terraform on AWS. The infrastructure is designed using a modular architecture approach to provision and manage core cloud resources such as networking, compute, storage, and database services.

The project also integrates:

- Remote Terraform backend using S3 and DynamoDB
- Policy-as-Code using OPA and Conftest
- Infrastructure drift detection
- Infrastructure verification automation scripts
- Reusable Terraform modules
- GitHub version control workflow

The overall goal of the project is to automate scalable and secure cloud infrastructure provisioning following DevOps and IaC best practices.

---

# Objectives

- Provision AWS infrastructure using Terraform
- Create reusable Terraform modules
- Configure remote Terraform state management
- Implement Policy-as-Code validation using OPA
- Deploy compute, storage, networking, and database resources
- Automate infrastructure verification
- Implement Terraform drift detection
- Maintain infrastructure using version-controlled IaC

---

# Technologies Used

| Technology     | Purpose                            |
| -------------- | ---------------------------------- |
| Terraform      | Infrastructure provisioning        |
| AWS            | Cloud platform                     |
| EC2            | Compute resource                   |
| S3             | Object storage + Terraform backend |
| DynamoDB       | Terraform state locking            |
| RDS MySQL      | Managed database                   |
| OPA            | Policy-as-Code                     |
| Conftest       | Terraform policy validation        |
| GitHub         | Version control                    |
| WSL Ubuntu     | Linux-based execution environment  |
| VS Code        | Development IDE                    |

---

# Architecture Overview

The infrastructure consists of:

- Custom VPC
- Public subnet
- Private subnets
- Internet Gateway
- Route Tables
- EC2 instance
- S3 bucket
- RDS MySQL database
- Terraform remote backend
- OPA policy validation layer

## Infrastructure Flow

Developer
   ↓
Terraform
   ↓
AWS Provider
   ↓
VPC
 ├── Public Subnet → EC2 Instance
 └── Private Subnets → RDS Database

S3 Bucket → Terraform Remote State
DynamoDB → State Locking
OPA/Conftest → Policy Validation

---

# Project Structure

IAC-PROJECT/
│
├── backend/
│   └── main.tf
│
├── modules/
│   ├── network/
│   ├── compute/
│   ├── storage/
│   └── database/
│
├── policies/
│   └── security.rego
│
├── scripts/
│   ├── drift-detection.sh
│   └── validate.sh
│
├── screenshots/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
└── README.md

---

# Terraform Modules

## 1. Network Module

Responsible for provisioning:

- VPC
- Public subnet
- Private subnets
- Internet Gateway
- Route Table
- Route Table Association

### Features

- CIDR-based networking
- Public and private network segmentation
- Reusable network configuration
- Route management

---

## 2. Compute Module

Responsible for provisioning:

- EC2 Instance
- Security Group

### Features

- Controlled inbound access
- SSH and HTTP rules
- Public subnet deployment
- Tagged infrastructure resources

---

## 3. Storage Module

Responsible for provisioning:

- S3 Bucket
- Bucket Versioning

### Features

- Object storage provisioning
- Versioning enabled
- Reusable storage module

---

## 4. Database Module

Responsible for provisioning:

- RDS MySQL Database
- DB Subnet Group

### Features

- Private database deployment
- Managed relational database
- Database subnet isolation
- Secure infrastructure design

---

# Remote Backend Configuration

Terraform remote backend was implemented using:

- Amazon S3 for Terraform state storage
- DynamoDB for Terraform state locking

## Benefits

- Prevents local state dependency
- Avoids concurrent state corruption
- Supports collaborative infrastructure management
- Maintains infrastructure consistency

---

# Policy-as-Code Implementation

Policy validation was implemented using:

- OPA (Open Policy Agent)
- Conftest

## Policies Implemented

- RDS database should not be publicly accessible
- Only approved EC2 instance types are allowed
- Resources must contain tags
- S3 bucket public ACLs must be blocked

## Validation Workflow

Terraform Plan
      ↓
Terraform Plan JSON
      ↓
OPA / Conftest Validation
      ↓
Policy Compliance Check

---

# Infrastructure Verification Script

A Bash-based infrastructure verification script was implemented to validate deployed cloud resources.

## Verification Includes

- AWS identity validation
- VPC verification
- Subnet verification
- Internet Gateway verification
- Route Table verification
- Security Group verification
- EC2 verification
- S3 bucket verification
- RDS verification
- DynamoDB verification
- Terraform state verification

## Script

./scripts/validate.sh

---

# Terraform Drift Detection

Terraform drift detection was implemented using Terraform detailed exit codes.

## Purpose

Detects infrastructure inconsistencies between:

- Actual AWS resources
- Terraform-managed state

## Workflow

Terraform Plan
      ↓
Detailed Exit Code
      ↓
Drift Detection Result

## Script

./scripts/drift-detection.sh

---

# Deployment Steps

## Step 1: Clone Repository

git clone <repository-url>
cd IAC-PROJECT

---

## Step 2: Configure AWS CLI

aws configure

Provide:

- AWS Access Key
- AWS Secret Key
- Region
- Output format

---

## Step 3: Initialize Backend

cd backend
terraform init
terraform apply
cd ..

---

## Step 4: Initialize Terraform

terraform init

---

## Step 5: Format Terraform Files

terraform fmt -recursive

---

## Step 6: Validate Terraform Configuration

terraform validate

---

## Step 7: Generate Terraform Plan

terraform plan -out=tfplan

---

## Step 8: Convert Plan to JSON

terraform show -json tfplan > tfplan.json

---

## Step 9: Run OPA Policy Validation

conftest test tfplan.json --policy policies

---

## Step 10: Deploy Infrastructure

terraform apply

---

## Step 11: Verify Infrastructure

./scripts/validate.sh

---

## Step 12: Run Drift Detection

./scripts/drift-detection.sh

---

# Terraform Outputs

The following outputs are generated after deployment:

- VPC ID
- EC2 Public IP
- S3 Bucket Name
- Database Endpoint

---

# Security Best Practices Implemented

- Remote backend state management
- State locking using DynamoDB
- Security groups for network access control
- Private RDS deployment
- Policy-based infrastructure validation
- Git ignore rules for sensitive files
- Tagged infrastructure resources

---

# Screenshots

The project includes screenshots for:

- Terraform initialization
- Terraform validation
- Terraform plan
- Terraform apply
- OPA validation
- AWS Console resources
- Drift detection
- Infrastructure verification
- GitHub repository

---

# Conclusion

This project successfully demonstrates Infrastructure as Code implementation using Terraform on AWS with a modular and reusable architecture approach.

The infrastructure provisioning process includes:

- Automated deployment
- Remote state management
- Policy-based validation
- Infrastructure verification
- Drift detection
- Secure resource provisioning

The project follows DevOps and cloud engineering best practices for scalable and maintainable infrastructure automation.

---

# Future Improvements

Possible future enhancements include:

- CI/CD integration using GitHub Actions
- Multi-environment deployments
- Load balancing and autoscaling
- Monitoring and observability integration
- Advanced security policies
- Kubernetes-based deployment

---

# Author

Farhan Ahmad

B.Tech CSE
Infrastructure as Code Project
Terraform + AWS + OPA
