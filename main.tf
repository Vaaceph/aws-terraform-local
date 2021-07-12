terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "eu-central-1"
}

resource "aws_instance" "app_server_1" {
  ami           = var.ami_name
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.instance_name_1
  }
}

resource "aws_instance" "app_server_2" {
  ami           = var.ami_name
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.instance_name_2
  }
}
