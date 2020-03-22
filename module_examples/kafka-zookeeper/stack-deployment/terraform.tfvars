/*
 Variables for deploying stack
--------------------------------
*/

// ## General Variables
region            = "us-east-1"
azs               = ["us-east-1b","us-east-1c"]
vpc_name          = "Kafka-Infra"
vpc_cidr          = "192.168.0.0/16"
environment       = "dev"

/* Classes of instances - has to change based on environment
- Please choose between the following only
- [test|dev|qa|stage]
*/

# AZs are combintation of az length + subnet cidrs
public_sub_cidr   = ["192.168.0.0/24","192.168.1.0/24"]
private_sub_cidr  = ["192.168.3.0/24","192.168.4.0/24"]


//##jenkins Master
//jenkins_master_instance_type         = "t2.medium"
//aws_key_name = "terraform-support-keys"
//jenkins-master-ami = "ami-66d9dc06"

aws_key_name = "amit-ec2"

kafka_image          = "ami-0e2ff28bfb72a4e45" 
kafka_instance_type  = "t2.medium"
kafka_instance_count = 0
kafka_cluster_size   = 0
