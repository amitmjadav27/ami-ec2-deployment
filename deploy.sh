#!/bin/bash

set -e

STACK_NAME="ami-ec2-deployment-stack"
REGION="ap-south-1"
TEMPLATE_FILE="cloudformation-template.yaml"

echo "Deploying EC2 instance using AMI from Parameter Store..."

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --region $REGION
  --parameter-overrides KeyName=amitmjadav008

echo "Stack deployed successfully!"

echo "Stack Outputs:"
aws cloudformation describe-stacks \
  --stack-name $STACK_NAME \
  --region $REGION \
  --query 'Stacks[0].Outputs[*].[OutputKey,OutputValue]' \
  --output table
