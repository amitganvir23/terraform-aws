variable "subnet_id" {}
variable "vpc_id" {}

variable "environment" {}

variable "azs" {}
variable "key_name" {}
variable "my_ami" {}

variable "tagg_p1" {}
variable "tagg_p2" {}

// Couchbase
variable "disk_name" {}
variable "mongo_ebs_vol_type" {}
variable "mongo_ebs_vol_size" {}
variable "mount_data_dir" {}

variable "mongo_master_asg_max_size" {}
variable "asg_min_size" {}
variable "mongo_master_asg_desired_size" {}
