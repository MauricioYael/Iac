resource "aws_instance" "mi_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Ejemplo de Amazon Linux 2
  instance_type = "t3.micro"
  tags = {
    Name = "MiInstanciaMauricio"
  }
}
