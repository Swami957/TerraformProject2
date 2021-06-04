provider "aws" {
  region = "us-east-1"

}
resource "aws_key_pair" "master" {
  key_name   = "master-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrQzPid12+nhJQFxSuQ1ogYL+/KM2U65+tP/3U2MOiV50jDczAC/6oThlokN9ySOvfqixbk3m2dJJcXTEmxVQEw6QnJEad3mhI03Sks+N6ArtDLsGsaaMfR90U1t/bvW19nlkkUKYXifkOiV2D2bXlvG/mk+FZUoi7Qloq+fNPaoj/oyqakq0sajt2Da0pdggnJ1D46ZT3suhHzF44vw9Szmb7kaRjRt67Ksktk99QOuTJB53mGZliiQanJSLsxGgU1ZIzod0c6sWAQCS2JvQ6fxITgX5Wbnily9pMcXG3E/Zojf2AtzDZecVFVrTUCONFIZcIE0gKWw309rtt/V8N root@ip-172-31-29-81.ec2.internal"
}
resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "my-sg"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

resource "aws_instance" "ec2_instance" {
  ami = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.my-sg.id}"]
  key_name = "${aws_key_pair.master.id}"
  tags = {
    Name = "my-first-ec2-instance"
  }
}