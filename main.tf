terraform {
  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "eu-central-1"
  profile="310199055229_AdministratorAccess"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

resource "aws_instance" "app_server_1" {
  ami           = var.ami_name
  instance_type = var.ec2_instance_type
  subnet_id     = module.vpc.public_subnets[0]
  tags = {
    Name = var.instance_name_1
  }
}

resource "aws_instance" "app_server_2" {
  ami           = var.ami_name
  instance_type = var.ec2_instance_type
  subnet_id     = module.vpc.public_subnets[1]
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
      key = "terraform.tfstate"
      region = "eu-central-1"
  }
}
