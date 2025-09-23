provider "aws" {
  region = "us-east-2" # puedes cambiar la región si deseas
}

resource "aws_key_pair" "mi_llave" {
  key_name   = "mi_llave_aws"
  public_key = file("/home/yayo_jp/.ssh/mi_llave_aws.pub")
}

resource "aws_instance" "mauricio_server_terr" {
  ami           = "ami-0cfde0ea8edd312d4" # Amazon Linux 2 AMI (ejemplo en us-east-1)
  instance_type = "t3.micro"
  key_name	= aws_key_pair.mi_llave.key_name

  tags = {
    Name = "MauricioServerTerraform"
  }
}
