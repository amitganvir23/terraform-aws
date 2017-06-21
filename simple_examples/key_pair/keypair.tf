provider "aws" {
  region     = "eu-west-1"
}


resource "aws_key_pair" "terra-amit-keypair" {
  key_name = "terra-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzyP+emgnXGI2InN/l1f2RE/0QfFi2Bt/mS5291hb8tfeJ/7ISpJU90rfUIztH+SGSWcqRbzdod4QF6dAyGBuGD+bApEsyc7yOscIog1kuafBnxfCZ4lQ3zvU3ApZEpeMRtLZ0FNc68aJQH3H5VNW4lKN8HaLQ8bl9MJKrShjIU/VjL/ZQeed4KdnkBKzQ68DZGYaqKHKqMmnKdjv1d3M1KehffwfXNNlkmuLEzcI+I7Ih7oOsfd9usQgNBfBXopuF6rXoZmyUSQPAyxW/XgvsrFOOzk6PvgcG57pvc4sN+8Dwvee+JERbgydwaB4B67btPGnFemt6pYlLVhRjyXW7 root@amit-server"
}

