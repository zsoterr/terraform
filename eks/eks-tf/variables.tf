variable "aws_region" {
    default = "eu-central-1"
}

# variable "instance_type" {
# }

# variable "aws_instance_azs" {
#     type = string
# }

# variable "aws_public_azs" {
# }

# variable "aws_instance_name" {
#     type = string
# }

variable "aws_vpc" {
    type = string
    default = "vpc-046336774cba7c8a8"
}

variable "default_tags" {
	type = map
	default = {
        "owner" = "A80819287",
        "nukeignore" = "true"
    }
    description = "Default resource tags"
}

 variable "subnets" {
   type = list
 }
