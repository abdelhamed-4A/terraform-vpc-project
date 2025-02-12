# Terraform VPC with Public and Private Subnets

This Terraform project creates a Virtual Private Cloud (VPC) with public and private subnets on AWS. The public subnet contains an EC2 instance and a NAT Gateway, while the private subnet contains an EC2 instance running Apache. This setup is ideal for hosting web applications with a secure architecture.

## Project Overview

### What is this project?
This project automates the creation of the following AWS resources using Terraform:

- **VPC**: A virtual network with a specified CIDR block.
- **Public Subnet**: A subnet with internet access, hosting:
  - An EC2 instance.
  - A NAT Gateway (to allow private subnet instances to access the internet).
- **Private Subnet**: A subnet without direct internet access, hosting:
  - An EC2 instance running Apache (webserver).
- **Security Groups**: Rules to control inbound and outbound traffic for the EC2 instances.
- **Route Tables**: To manage traffic between subnets and the internet.

### Architecture Diagram

![Architecture](/terraform-vpc/day1D.png)

### Features

- **Public Subnet**:
  - EC2 instance accessible via SSH.
  - NAT Gateway to allow private subnet instances to access the internet.

- **Private Subnet**:
  - EC2 instance running Apache (webserver).
  - Accessible only from the public subnet or via the NAT Gateway.

- **Security**:
  - Security groups restrict access to only necessary ports (SSH and HTTP).

- **Automation**:
  - All resources are created and managed using Terraform.

## Prerequisites

Before using this project, ensure you have the following:

- **AWS Account**: An active AWS account with sufficient permissions to create resources.
- **AWS CLI**: Installed and configured with your credentials.
- **Terraform**: Installed on your local machine or Cloud9 environment.
- **Cloud9 (Optional)**: If using AWS Cloud9, ensure the environment is set up with Terraform and AWS CLI.

## Setup Instructions

### 1. Clone the Repository

If this project is hosted in a Git repository, clone it to your local machine or Cloud9 environment:

```bash
git clone <repository-url>
cd <repository-folder>

