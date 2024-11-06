terraform {
  backend "s3" {
    bucket = "yopappiyo"
    key    = "expense-terraform/dev/state"
    region = "us-east-1"
  }
}
