variable "instance_name_1" {
  description = "EC2 first instance"
  type        = string
  default     = "ExampleAppServerInstance1"
}

variable "instance_name_2" {
  description = "EC2 second instance"
  type        = string
  default     = "ExampleAppServerInstance2"
}

variable "ami_name" {
  description = "Amazon Machine Image name"
  type        = string
  default     = "ami-0bad4a5e987bdebde"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}