variable "public_key" {
  description = "Path to the public key file to use for SSH access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "instances" {
  description = "Map of instance configurations"
  type = map(object({
    ami  = string
    type = string
  }))
  default = {
    server1 = {
      ami  = "ami-0c02fb55956c7d316"
      type = "t2.micro"
    }
    server2 = {
      ami  = "ami-0c02fb55956c7d316" 
      type = "t2.micro"
    }
  }
}

locals {
  instances = var.instances
}
