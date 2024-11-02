# Terraform ECS Project

This project demonstrates how to deploy an Amazon Elastic Container Service (ECS) cluster using Terraform and AWS Fargate. It provides a complete infrastructure setup for running containerized applications in a scalable and efficient manner.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Usage](#usage)
- [Cleanup](#cleanup)

## Prerequisites

Before you begin, ensure you have met the following requirements:
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with the necessary permissions to create ECS resources.
- AWS CLI configured with your credentials (run `aws configure`).

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/femmyte/teraform-ecs.git
   cd teraform-ecs
2. Initialize Terraform
    `terraform init`
## Project Structure
teraform-ecs/ \
├── main.tf            # Main Terraform configuration file\
├── variables.tf       # Variables used in the Terraform configuration\
├── outputs.tf         # Output values after deployment\
└── README.md          # Project documentation\

## Configuration
In the variables.tf file, you can customize the following parameters:

region: AWS region to deploy the ECS resources. \
cluster_name: Name of the ECS cluster. \
service_name: Name of the ECS service. \
task_definition: Configuration for the container task. \

## Deployment
To deploy the ECS cluster and service, run the following commands:

1. Plan the deployment:
    `terraform plan`
2. Apply the configuration:
    `terraform apply` \
**Confirm the apply when prompted by typing yes.**

## Usage
Once the deployment is complete, you can access your containerized application through the load balancer created in the ECS service. The output values will provide the necessary information, such as the load balancer URL.

## Cleanup
To destroy the infrastructure created by Terraform, run:
    `terraform destroy`