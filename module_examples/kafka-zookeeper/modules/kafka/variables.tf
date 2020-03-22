/*
   Variables for bastion
*/

variable "region" {}
variable "environment" {}

variable "vpc_id" {}
variable "vpc_cidr" {}

variable "aws_key_name" {}
variable "kafka_image" {}
variable "kafka_instance_type" {}
variable "kafka_instance_count" {}
variable "kafka_cluster_size" {}
