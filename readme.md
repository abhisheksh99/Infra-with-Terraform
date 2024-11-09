
# AWS Infrastructure Setup using Terraform

This repository contains Terraform configurations to set up a basic AWS infrastructure, including a Virtual Private Cloud (VPC), EC2 instances, and an S3 bucket.

## Architecture Overview

The architecture consists of the following components:

- **VPC (Virtual Private Cloud)**: A private network where your AWS resources reside.
- **Public Subnets**: Two public subnets where EC2 instances are deployed. These instances are accessible over the internet.
- **EC2 Instances**: Deployed in the public subnets, running applications or services.
- **S3 Bucket**: Used for storing files, backups, or static content.

## Terraform Configuration

### Requirements

- Terraform (>= 1.0)
- AWS CLI configured with appropriate access credentials

### Terraform Resources

1. **VPC**: A Virtual Private Cloud to host the infrastructure.
2. **Subnets**: Two public subnets created within the VPC.
3. **Security Groups**: Security groups allowing inbound and outbound traffic for the EC2 instances.
4. **EC2 Instances**: Two EC2 instances deployed within the public subnets.
5. **S3 Bucket**: An S3 bucket to store files.

## Setup Instructions

### 1. Install Terraform

Make sure you have Terraform installed. You can download it from [here](https://www.terraform.io/downloads).

### 2. Clone the Repository

Clone the repository to your local machine.

```bash
git clone https://github.com/your-repo/aws-infrastructure-terraform.git
cd aws-infrastructure-terraform
```

### 3. Configure AWS CLI

Ensure that your AWS CLI is configured with appropriate credentials.

```bash
aws configure
```

### 4. Initialize Terraform

Initialize Terraform in the repository directory.

```bash
terraform init
```

### 5. Plan the Infrastructure

Run the following command to see the infrastructure plan that Terraform will create:

```bash
terraform plan
```

### 6. Apply the Infrastructure

Apply the Terraform configuration to create the resources.

```bash
terraform apply
```

Confirm the apply by typing `yes` when prompted.

### 7. Verify the Infrastructure

After Terraform finishes, you can check the AWS Management Console to verify the creation of the VPC, subnets, EC2 instances, and S3 bucket.

### 8. Cleanup

To destroy the resources and avoid unnecessary charges, run:

```bash
terraform destroy
```

Confirm the destroy by typing `yes` when prompted.

## Conclusion

This Terraform configuration sets up a simple AWS infrastructure with VPC, EC2 instances, and S3 bucket. You can extend this setup by adding more AWS services as needed.

