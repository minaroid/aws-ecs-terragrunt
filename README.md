# AWS ECS Terraform Infrastructure

This repository contains Terraform configurations for deploying an ECS (Elastic Container Service) cluster on AWS using Terraform and Terragrunt.

## Overview

The infrastructure includes the following components:

- ECS Cluster: A managed ECS cluster to run containerized applications.
- Task Definitions: Definitions for Docker containers to be run in the ECS cluster.
- Services: ECS services to manage the tasks and maintain desired task count.
- Load Balancer: Application Load Balancer (ALB) for routing traffic to ECS services.

The ECS cluster is deployed in private subnets to enhance security and control access to resources. The network infrastructure ensures that ECS tasks are not directly exposed to the internet, providing a more secure environment for running containerized workloads.

## Prerequisites

Before you begin, ensure you have:

- AWS IAM credentials with sufficient permissions.
- Terraform and Terragrunt installed locally.
- Docker images for your applications pushed to a container registry (e.g., Amazon ECR).

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/minaroid/aws-ecs-terragrunt.git

2. Navigate to the cloned directory:

   ```bash
   cd aws-ecs-terragrunt/environments/development

3. Initialize Terragrunt:

   ```bash
   terragrunt run-all init

4. Review the Terraform plan:

   ```bash
   terragrunt run-all plan

5. Apply the Terraform configuration:

   ```bash
   terragrunt run-all apply

6. After applying the changes, you should see the ECS cluster and associated resources deployed in your AWS account.

7. Navigate to ECR console and follow the steps to push an image to the repository with this name and tag `nodejs-express:development`
   
8. Force ECS service for new deployment:   

   ```bash
   aws ecs update-service --cluster development-ecs-cluster --service development-ecs-service --force-new-deployment


## Customization

Feel free to customize the Terraform configurations according to your requirements. You can adjust variables, add or remove resources, or modify configurations as needed.


## Cleanup

To destroy the infrastructure and clean up resources:

  ```bash
  terragrunt run-all destroy



