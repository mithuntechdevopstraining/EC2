variable "ami" {
  type = string
  description = "AMI For Creating Ec2"
}

variable "instance_type" {
  type = string
  description = "Instance Type Of ec2"
}

variable "key_name" {
  type = string
  description = "Key Pair to be used for ec2"
}

variable "availability_zone" {
  type = string
  description = "AZ of ec2"
}

variable "ec2count" {
  type = number
  default = 1
  description = "Number aws_instances to be created"
}

variable "vpc_id" {
  type = string
  description = "VPC  Id of S.G"
  default = null
}
variable "subnet_id" {
  type = string
  description = "Specify Subnet Id of ec2"
  default = null
}
variable "tags" {
  type = map(string)
  description = "common tags"
}

variable "ec2_name" {
  type = string
  description = "Name of the ec2 instance"
}

variable "sg_name" {
  type = string
  description = "SG Name"
}

variable "sg_description" {
  type = string
  description = "SG Description"
}

variable "sg_inbound_rules" {
  type = list(object({
    from_port   = number,
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow SSH Port"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
