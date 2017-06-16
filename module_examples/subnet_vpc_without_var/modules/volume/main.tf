### To create a New Volume
resource "aws_ebs_volume" "v1" {
  availability_zone = "ap-southeast-1a"
  size              = "8"
  type = "gp2"
  tags = {
	Name = "couchbase_vol1"
	}
}
