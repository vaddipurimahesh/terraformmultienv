locals {
  ami_id = data.aws_ami.godevops.id
  environment = terraform.workspace
}