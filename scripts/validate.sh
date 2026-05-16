#!/bin/bash

echo "AWS Infrastructure Verification"

REGION="eu-north-1"
STATE_BUCKET="iac-state-farhan-12345"

echo ""
echo "1. Checking AWS Identity..."
aws sts get-caller-identity

echo ""
echo "2. Checking VPCs..."
aws ec2 describe-vpcs --region $REGION --query "Vpcs[*].[VpcId,CidrBlock]" --output table

echo ""
echo "3. Checking Subnets..."
aws ec2 describe-subnets --region $REGION --query "Subnets[*].[SubnetId,AvailabilityZone,CidrBlock]" --output table

echo ""
echo "4. Checking Internet Gateways..."
aws ec2 describe-internet-gateways --region $REGION --query "InternetGateways[*].[InternetGatewayId]" --output table

echo ""
echo "5. Checking Route Tables..."
aws ec2 describe-route-tables --region $REGION --query "RouteTables[*].[RouteTableId]" --output table

echo ""
echo "6. Checking Security Groups..."
aws ec2 describe-security-groups --region $REGION --query "SecurityGroups[*].[GroupId,GroupName]" --output table

echo ""
echo "7. Checking EC2 Instances..."
aws ec2 describe-instances --region $REGION --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]" --output table

echo ""
echo "8. Checking S3 Buckets..."
aws s3 ls

echo ""
echo "9. Checking RDS Databases..."
aws rds describe-db-instances --region $REGION --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,Engine]" --output table

echo ""
echo "10. Checking DynamoDB Tables..."
aws dynamodb list-tables --region $REGION

echo ""
echo "11. Checking Terraform Remote State..."
aws s3 ls s3://$STATE_BUCKET/core-cloud/ --region $REGION

echo ""
echo "INFRASTRUCTURE VERIFICATION COMPLETE"