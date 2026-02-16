#!/bin/bash

INSTANCE_ID=$(aws ec2 describe-instances \
  --query "Reservations[].Instances[].InstanceId" \
  --output text)

  for instance in $INSTANCE_ID
  do
    aws ec2 terminate-instances --instance-ids "$instance"
  done
