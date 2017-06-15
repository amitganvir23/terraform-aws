provider "aws" {
  region     = "ap-southeast-1"
  #access_key = "aaaaaaaaaaaaaaaaaaaaaa"
  #secret_key = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
}

### To create a New Volume
resource "aws_ebs_volume" "v1" {
  availability_zone = "ap-southeast-1a"
  size              = "8"
  type = "gp2"
  tags = {
	Name = "couchbase_vol1"
	}
}

### attached your New volume
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdj"
  volume_id   = "${aws_ebs_volume.v1.id}"
  instance_id = "i-06d7ccfc18a2cd582"
}

