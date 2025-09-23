data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  instances = {
    dev = {
      ami  = data.aws_ami.ubuntu.id
      type = "t3.micro"
    }
    qa = {
      ami  = data.aws_ami.ubuntu.id
      type = "t3.micro"
    }
    prod = {
      ami  = data.aws_ami.ubuntu.id
      type = "t3.micro"
    }
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ec2"
  public_key = file(pathexpand(var.public_key))
}

resource "aws_instance" "this" {
  for_each                    = local.instances
  ami                         = each.value.ami
  instance_type               = each.value.type
  key_name                    = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = each.key
  }
}

output "aws_instances" {
  value = {
    for name, instance in aws_instance.this : name => instance.public_ip
  }
}

variable "public_key" {
  description = "Path to the public key file to use for SSH access"
  type        = string
}