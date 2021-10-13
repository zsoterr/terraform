provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "test1" {
  ami = "ami-07df274a488ca9195"
  instance_type = "t2.micro"
}

resource "aws_eip" "eip" {
  instance = aws_instance.test1.id
  vpc      = true
}
