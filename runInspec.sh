#!/bin/bash

ECSCLUSTER=$1;

echo "Get the attributes from the AWS environment";

echo "Get Instances running in $ECSCLUSTER";

for instance in $(~/.local/bin/aws ecs list-container-instances --cluster kaccdcpatestcluster | grep "arn" | awk -F / '{print $2;}' | tr -d '\"\,\ '); do
  inst=$(~/.local/bin/aws ecs describe-container-instances --cluster $ECSCLUSTER --container-instances $instance | grep ec2InstanceId | cut -d \" -f4);
  inst_array=( "${inst_array[@]}" "$inst" );
done

echo ${inst_array[@]}

~/.local/bin/aws ec2 describe-instances --instance-ids ${inst_array[@]} > aws-security/files/aws_ec2.json;

echo "Getting the ECS cluster attributes"

~/.local/bin/aws ecs describe-clusters --cluster $ECSCLUSTER > aws-security/files/aws_ecs.json;

/usr/bin/inspec exec aws-security -t aws://ap-southeast-1 --reporter cli junit:inspec.xml;
