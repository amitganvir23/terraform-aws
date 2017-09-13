// General
## Region
region            = "ap-southeast-1"

## vpc and subnet
vpc_cidr          = "10.10.0.0/16"
subnet_cidr          = "10.10.1.0/24"

## env
environment       = "my-dev"
zone       = "ap-southeast-1a"

## AMI
master_ami 	= "ami-0a3eb769"
slave_ami 	= "ami-8b3eb7e8"
#my_ami 	= "ami-58d65b3b"

## key pair
key_name = "terra-amit-key"

## EC2 tag name
tagg_p1 = "jenkins_master"
tagg_p2 = "jenkins_slave"

