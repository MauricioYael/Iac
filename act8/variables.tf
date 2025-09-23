variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}
