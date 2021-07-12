terraform {
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

## Specifies the S3 Bucket and DynamoDB table used for the durable backend and state locking

terraform {
    backend "s3" {
      encrypt = true
      bucket = "test-repository"
      dynamodb_table = "terraform-state-lock-dynamo-2"
      key = "path/path/terraform.tfstate"
      region = "eu-central-1"
  }
}
