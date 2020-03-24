resource "aws_launch_configuration" "zookeeper_lc" {
  name                 = "${var.zookeeper_lc}"
  image_id             = "${var.zookeeper_image}"
  instance_type        = "${var.zookeeper_instance_type}"
  key_name             = "${var.aws_key_name}"
  security_groups      = ["${var.zookeeper_sg}"]
  #user_data           = "${data.template_file.user_data_zookeeper.rendered}"
  user_data            = "${file("zookeeper_userdata.sh")}"
  count                = "${var.zookeeper_instance_count}"
  iam_instance_profile = "${var.zookeeper_profile_iam_id}"
  associate_public_ip_address = true
  root_block_device {
  volume_type = "gp2"
  volume_size = 30
  delete_on_termination = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "zookeeper_asg" {
  availability_zones        = ["${var.azs}"]
  name                      = "${var.environment}-zookeeper-asg"
  max_size                  = "${var.zookeeper_cluster_size}"
  min_size                  = "${var.zookeeper_cluster_size}"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = "${var.zookeeper_cluster_size}"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.zookeeper_lc.id}"
  vpc_zone_identifier       = ["${var.aws_pub_subnet_id_str}"]
  #vpc_zone_identifier       = ["subnet-0a216d381a7a3995a,subnet-056e9002d6f820152"]

  tags = [{
    key                 = "Name"
    value               = "${var.environment}-zookeeper"
    propagate_at_launch = true
  },{
    key                 = "environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }]
}
