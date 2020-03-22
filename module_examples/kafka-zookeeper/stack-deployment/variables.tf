/*
   Variables for all modules
*/


// Generic
variable "azs" {
    default = []
}

// VPC
variable "region" {}
variable "environment" {}
variable "vpc_cidr" {}
variable "vpc_name" {}


variable "public_sub_cidr" {
     default = []
}

variable "private_sub_cidr" {
     default = []
}

//##jenkins
//variable "jenkins-master-ami" {}
//variable "jenkins_master_instance_type" {}

variable "aws_key_name" {}
variable "kafka_image" {}
variable "kafka_instance_type" {}
variable "kafka_instance_count" {}
variable "kafka_cluster_size" {}
