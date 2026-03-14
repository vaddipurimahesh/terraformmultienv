resource "aws_instance" "delivery" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
      name = "terraform-${var.environment}"
      project = "roboshop"
      environment = var.environment
    }
}

resource "aws_security_group" "allow_tls" {
  name = "allow-all-terraform-${var.environment}"
  description = "Allow all TLS inbound and oubound traffic"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "allow-all-terraform-${var.environment}"
  }
}
