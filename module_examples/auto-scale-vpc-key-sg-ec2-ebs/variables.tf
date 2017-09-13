variable "region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "subnet_cidr" {}


## env
variable "environment" {}
variable "azs" {}
variable "my_ami" {}
variable "key_name" {}

variable "tagg_p1" {}
variable "tagg_p2" {}

// Couchbase EBS Volume for Instance
variable "disk_name" {}
variable "mongo_ebs_vol_type" {}
variable "mongo_ebs_vol_size" {}
variable "mount_data_dir" {}

variable "mongo_master_asg_max_size" {}
variable "asg_min_size" {}
variable "mongo_master_asg_desired_size" {}
