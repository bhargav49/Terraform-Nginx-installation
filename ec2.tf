# key-pair

resource "aws_key_pair" "deployer" {
  key_name   = "ng-key"
  public_key = file("ng-key.pub")
}

# vpc and security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group"  "my_security"{

  name  = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id   = aws_default_vpc.default.id  #interpolation

# inbound rules
ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
}
ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}
ingress{
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask app"
}
# Outbound Rules
egress{
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  description = "access to all"
}
}

# EC2 instance
resource "aws_instance" "my_instance"{

key_name =  aws_key_pair.deployer.key_name
security_groups = [aws_security_group.my_security.name]
instance_type = var.ec2_instance_type
ami = var.ec2_ami_id  #Insert ami id
user_data = file("nginx_install.sh")

#storage
root_block_device{
  volume_size = var.aws_root_storage_size
  volume_type = "gp3"
}

tags = {
 name = "Tarraform practice instance"
}
}

