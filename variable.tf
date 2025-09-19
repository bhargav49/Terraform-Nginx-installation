resource "ec2_instance_type"{
  default = "t2.micro"
  type = string
}

resource "aws_root_storage_size"{
  default = 15
  type = number
}

resource "ec2_ami_id"{
  default = "ami-0ca4d5db4872d0c28"
  type = string

}
