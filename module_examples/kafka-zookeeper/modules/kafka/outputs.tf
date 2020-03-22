output "kafka-sg" {
   value = "${aws_security_group.kafka-sg.id}"
}
output "jenkins_master_id" {
   value = "${aws_instance.kafka.id}"
}
