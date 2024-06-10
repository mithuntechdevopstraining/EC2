resource "aws_instance" "main" {
  count = var.ec2count
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  availability_zone = var.availability_zone
  subnet_id = var.subnet_id
  tags = merge({"Name" : var.ec2_name} , var.tags)
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  name = var.sg_name
  description = var.sg_description
  vpc_id = var.vpc_id

   dynamic "ingress" {
    for_each = var.sg_inbound_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      cidr_blocks = ingress.value.cidr_blocks
      protocol    = ingress.value.protocol
      description = ingress.value.description
    }
  }
  egress {
    from_port = 0
    to_port =  0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Traffic for all the destinations"
  }

}