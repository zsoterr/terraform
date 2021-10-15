provider "aws" {
  region     = "us-west-2"
}


module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"
  
  # insert the 10 required variables here
  ami = "ami-0b1e2eeb33ce3d66f"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  ipv6_address_count = 0
  ipv6_addresses = []
  name = "example-1-module"
  instance_count = 1
  private_ip = ""
  user_data = ""
  vpc_security_group_ids = ["sg-73dc7533"]
  subnet_id = "subnet-0bcedd72"
}
