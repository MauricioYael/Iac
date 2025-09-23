variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID de la máquina (Ubuntu 22.04 por ejemplo)"
  type        = string
}

variable "key_name" {
  description = "Nombre de la llave SSH existente en AWS"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subred donde se creará la instancia"
  type        = string
}

variable "security_group_id" {
  description = "ID del security group asociado a la instancia"
  type        = string
}