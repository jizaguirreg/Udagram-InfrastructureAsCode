# Udagram-InfrastructureAsCode
ND9991 - Course 2 - Infrastructure As Code (IaC)

# Run:
chmod +x scripts.sh

# Execution Order AWS CLI:

# 1. Usage For Create, Delete and Update Network:
   ./scripts.sh create-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network network.yml network.json
   ./scripts.sh update-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network network.yml network.json
   ./scripts.sh delete-network us-east-1 JoaquinIzaguirre-IaC-Udagram-Network

# 2. Usage For S3 Create, Delete and Update Bucket:
   ./scripts.sh create-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml
   ./scripts.sh update-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml
   ./scripts.sh delete-s3 us-east-1 joaquinizaguirre2024-s3-udagram-nd9991-iac s3.yml

# 3. Usage For Udagram Create, Delete and Update Infrastructure:
   ./scripts.sh create-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json
   ./scripts.sh update-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json
   ./scripts.sh delete-udagram us-east-1 JoaquinIzaguirre-IaC-Udagram-Servers udagram.yml udagram.json

