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

// AWS Key Pair //
aws_key_name = "amit-ec2"

// Kafka Variables //
kafka_lc             = "Kafka_LC"
kafka_image          = "ami-0e2ff28bfb72a4e45" 
kafka_instance_type  = "t2.micro"
kafka_instance_count = 1
kafka_cluster_size   = 0
// Tags //
kafka_service        = "kafka"


// Zookeeper Variables //
zookeeper_lc             = "Zookeeper_LC"
zookeeper_image          = "ami-0e2ff28bfb72a4e45" 
zookeeper_instance_type  = "t2.micro"
zookeeper_instance_count = 1
zookeeper_cluster_size   = 0
zookeeper_service        = "zookeeper"

// Route 53 //
zone_name = "glp-test4.com"
rec_name  = kafka.glp.test4.com


