output "instance1_id" {
  value = "${element(aws_instance.ec2_instance.*.id, 1)}"
}
output "instance2_id" {
  value = "${element(aws_instance.ec2_instance.*.id, 2)}"
}

output "server_ip" {
  value = "${join(",",aws_instance.ec2_instance.*.public_ip)}"
}
