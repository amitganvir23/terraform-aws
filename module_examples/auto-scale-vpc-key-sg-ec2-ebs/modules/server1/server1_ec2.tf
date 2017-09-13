
### ec2 instance aws_instance or aws_launch_configuration
resource "aws_launch_configuration" "my-ec2-lc" {
  name_prefix	     	= "My-Test-VM-amit-${var.environment}"
  image_id          	= "${var.my_ami}"
  instance_type 	= "t2.micro"
  key_name 		= "${var.key_name}"
  associate_public_ip_address = true
  #associate_public_ip_address = false
  security_groups 	= ["${aws_security_group.sg_test.id}"]
  user_data                   = "${data.template_file.userdata-vm.rendered}"


  root_block_device {
    volume_type = "standard"
    volume_size = 30
    delete_on_termination = true
	}


  ebs_block_device {
    device_name           = "${var.disk_name}"
    volume_type           = "${var.mongo_ebs_vol_type}"
    volume_size           = "${var.mongo_ebs_vol_size}"
    // This has to persist post reboots
    delete_on_termination = true
    //delete_on_termination = false
  }


  connection {
    user  = "ec2-user"
    agent = true
  }


  lifecycle {
    create_before_destroy = true
  }

}



resource "aws_autoscaling_group" "my-ec2-asg" {
  vpc_zone_identifier 	= ["${var.subnet_id}"]
  availability_zones        = ["${var.azs}"]
  name			= "Test-vm-amit-${var.environment}"
  max_size                  = "${var.mongo_master_asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  health_check_grace_period = 100
  health_check_type         = "EC2"
  desired_capacity          = 1
  #force_delete              = false
  launch_configuration      = "${aws_launch_configuration.my-ec2-lc.name}"

 // Setting this to true would not allow us to delete the ECS clusters
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "My-EC2-Vm-amit"
    propagate_at_launch = true
  }

  tag {
    key                 = "Role"
    value               = "my-server1"
    propagate_at_launch = true
  }



  depends_on = ["aws_launch_configuration.my-ec2-lc"]

}

/* We use this to create this as a dependency for other modules */
resource "null_resource" "module_dependency" {
  depends_on = ["aws_autoscaling_group.my-ec2-asg"]
}

