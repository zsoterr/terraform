

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  
}

variable "aws_ami_id" {
    type = string
    description = "The id of the machine image (AMI) to use for the server."
    default = "ami-04e59c05167ea7bd5"
}

variable "vpc_val" {
    type = bool
}


variable "cidrs" {
  type = "list"
  default = [ "10.0.0.0/16", "10.1.0.0/16" ]
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}


variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}


