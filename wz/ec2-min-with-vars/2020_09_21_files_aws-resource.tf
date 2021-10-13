
provider "aws" {
  region     = var.region
}

resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami           = var.aws_ami_id
}


