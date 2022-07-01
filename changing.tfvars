# What is the AWS Region you're working in?
aws_region    = "us-east-1"

# Assign the VPCs prefixes based on their function: app and db
env_prefix = ["app", "db"]

# Waht is the public IP address you will be SSHing from?
your_public_ip = "8.8.8.8/32"

# In which AZ are you creating the App VPC?
app_az = "us-east-1c"
# Wjhat is the CIDR range of the App VPC?
app_vpc_cidr = "172.23.0.0/16"
# What are the names of subnets you are creating in App VPC?
app_subnet_name = ["subnet-a", "subnet-b"]
# What are the corresponding IPs you want to assign to each subnet?
app_subnet_cidr = ["172.23.0.0/24","172.23.1.0/24"]
# What are the names of the security groups you want to create in App VPC?
app_sg_name = ["app-sg-a", "app-sg-b"]
# What are the names of the EC2 instances in App VPC?
app_ec2_name = ["app-ec2-a", "app-ec2-b"]
# What Ip address are you looking to assign to each App EC2 instance?
app_ec2_ip = ["172.23.0.4", "172.23.1.4"]

# In which AZ are you creating the DB VPC?
db_az = "us-east-1d"
# Wjhat is the CIDR range of the App VPC?
db_vpc_cidr = "172.24.0.0/16"
# What are the names of subnets you are creating in DB VPC?
db_subnet_name = ["subnet-a", "subnet-b"]
# What are the corresponding IPs you want to assign to each subnet?
db_subnet_cidr = ["172.24.0.0/24", "172.24.1.0/24"]
# What are the names of the security groups you want to create in DB VPC?
db_sg_name = ["db-sg-a", "db-sg-b"]
# What are the names of the EC2 instances in App VPC?
db_ec2_name = ["db-ec2-a", "db-ec2-b"]
# What Ip address are you looking to assign to each DB EC2 instance?
db_ec2_ip = ["172.24.0.4", "172.24.1.4"]

# The AWS account number where the VPC resides. 
# Only the accepter side is needed. In this case, I'm only using the db vpc as accepter. app vpc is peering requester.
app_vpc_owner_id = "AWS_ACCOUNT_ID_GOES_HERE"
db_vpc_owner_id = "AWS_ACCOUNT_ID_GOES_HERE"