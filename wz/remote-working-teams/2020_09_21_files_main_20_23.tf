terraform {
  backend "s3" {
    bucket = "whizlabs-remote"
    key    = "mystate-1/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "remote1" {
  backend = "s3"
  config = {
    bucket = "whizlabs-remote"
    key    = "mystate/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.ebs_azs
  size              = 10
}

resource "aws_volume_attachment" "name" {
  device_name = var.volume_device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = data.terraform_remote_state.remote1.outputs.instance_id
}

