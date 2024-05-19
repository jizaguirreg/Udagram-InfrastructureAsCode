#!/bin/bash
# Joaquin Izaguirre
#
# Execute:
# chmod +x scripts.sh
#
# Parameters
#   $1: Execution mode. Valid values:
#
# 1. Usage For Network:
#   ./scripts.sh create-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network network.yml network.json
#   ./scripts.sh update-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network network.yml network.json
#   ./scripts.sh delete-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network
#
# 2. Usage For S3 Bucket:
#   ./scripts.sh create-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml
#   ./scripts.sh update-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml
#   ./scripts.sh delete-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml
#
# 3. Usage For Udagram Infrastructure:
#   ./scripts.sh create-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json
#   ./scripts.sh update-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json
#   ./scripts.sh delete-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json


# Validate parameters
if [[ $1 != "create-network" && $1 != "delete-network" && $1 != "update-network" && $1 != "create-udagram" && $1 != "delete-udagram" && $1 != "update-udagram" && $1 != "create-s3" && $1 != "delete-s3" && $1 != "update-s3"  ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: create-network , delete-network, update-network, create-udagram, update-udagram, delete-udagram1 create-s3, update-s3, delete-s3" >&2
    exit 1
fi


EXECUTION_MODE=$1
REGION=$2
STACK_NAME=$3
TEMPLATE_FILE_NAME=$4
PARAMETERS_FILE_NAME=$5

# Execute CloudFormation Network

if [ $EXECUTION_MODE == "create-network" ]
then
aws cloudformation create-stack \
    --stack-name $3 \
    --template-body file://$4   \
    --parameters file://$5  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=$2
fi


if [ $EXECUTION_MODE == "delete-network" ]
then

aws cloudformation delete-stack \
    --stack-name $3 \
    --region=$2

fi

if [ $EXECUTION_MODE == "update-network" ]
then
aws cloudformation update-stack \
    --stack-name $3  \
    --template-body file://$4   \
    --parameters file://$5  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=$2
fi

# Execute CloudFormation Infrastructure Udagram


if [ $EXECUTION_MODE == "create-udagram" ]
then
aws cloudformation create-stack \
    --stack-name $3 \
    --template-body file://$4   \
    --parameters file://$5  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=$2
fi

if [ $EXECUTION_MODE == "delete-udagram" ]
then

aws cloudformation delete-stack \
    --stack-name $3 \
    --region=$2

fi

if [ $EXECUTION_MODE == "update-udagram" ]
then
aws cloudformation update-stack \
    --stack-name $3  \
    --template-body file://$4   \
    --parameters file://$5  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=$2
fi


# Execute CloudFormation S3

if [ $EXECUTION_MODE == "create-s3" ]
then
aws cloudformation create-stack \
    --stack-name $3 \
    --template-body file://$4   \
    --region=$2
fi

if [ $EXECUTION_MODE == "delete-s3" ]
then

aws cloudformation delete-stack \
    --stack-name $3 \
    --region=$2

fi

if [ $EXECUTION_MODE == "update-s3" ]
then
aws cloudformation update-stack \
    --stack-name $3  \
    --template-body file://$4   \
    --region=$2
fi
