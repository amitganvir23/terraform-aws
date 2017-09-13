// General
region            = "ap-southeast-1"
#region            = "eu-west-1"
vpc_cidr          = "10.10.0.0/16"
vpc_name          = "project-igi-DEV-ANLATICS-amit"
subnet_cidr          = "10.10.1.0/24"

## env
environment       = "dev-anlatics-amit"
azs       = "ap-southeast-1a"
my_ami 	= "ami-fdb8229e"
key_name = "terra-amit-key"

tagg_p1 = "Couchbase_master1-amit"
tagg_p2 = "master1"

# This needs to be io1 for prod - EBS volume for Instance
disk_name = "/dev/xvdf"
mongo_ebs_vol_type = "gp2"
mongo_ebs_vol_size = 10
mount_data_dir     = "/mongobase-data"

mongo_master_asg_max_size = "1"
asg_min_size = "1"
mongo_master_asg_desired_size = "1"
