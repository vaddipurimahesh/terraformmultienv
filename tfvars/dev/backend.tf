terraform {
  backend "s3" {
    bucket = "devops-daws-s3"
    key = "devops.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}
