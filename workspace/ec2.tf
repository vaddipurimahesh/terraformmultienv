resource "aws_instance" "delivery" {
  ami = local.ami_id
  instance_type = lookup(var.instance_type,local.environment)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    name = "${var.project}-${local.environment}"
    project = "roboshop"
    environment = local.environment
  }
}

resource "aws_security_group" "allow_tls" {
  name = "allow-all-terraform-${local.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
 
  ingress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
  tags = {
    name = "allow-all-terraform-${local.environment}"
  }
}


