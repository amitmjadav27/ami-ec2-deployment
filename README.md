# AMI EC2 Deployment

Simple AWS CloudFormation template to deploy EC2 instances using the custom AMI created by [ami-factory](https://github.com/amitmjadav27/ami-factory).

## Overview

This repository contains a minimal CloudFormation template that:
- Retrieves the AMI ID from AWS Systems Manager Parameter Store (`/ami-factory/github-actions-linux-ami-id`)
- Deploys a t3.micro EC2 instance using that AMI
- Outputs the Instance ID and Public IP

## Prerequisites

- AWS Account with appropriate IAM permissions
- AWS CLI configured with credentials
- AMI ID stored in Parameter Store at `/ami-factory/github-actions-linux-ami-id`

## Quick Start

### Deploy using the script

```bash
chmod +x deploy.sh
./deploy.sh
```

### Deploy using AWS CLI directly

```bash
aws cloudformation deploy \
  --template-file cloudformation-template.yaml \
  --stack-name ami-ec2-deployment-stack \
  --region us-east-1
```

## Stack Outputs

After deployment, you'll get:
- **InstanceId**: The EC2 Instance ID
- **PublicIP**: Public IP Address of the instance
- **AMIId**: The AMI ID used for deployment

## Cleanup

To delete the stack and EC2 instance:

```bash
aws cloudformation delete-stack \
  --stack-name ami-ec2-deployment-stack \
  --region us-east-1
```

## Files

- `cloudformation-template.yaml` - CloudFormation template
- `deploy.sh` - Deployment script
- `README.md` - This file
