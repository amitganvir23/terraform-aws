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
//variable "aws_key_name" {}
variable "vpc_cidr" {}
variable "vpc_name" {}


variable "public_sub_cidr" {
     default = []
}

variable "private_sub_cidr" {
     default = []
}

//##jenkins
//variable "aws_key_name" {}
//variable "jenkins-master-ami" {}
//variable "jenkins_master_instance_type" {}
