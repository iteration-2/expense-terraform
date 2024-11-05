data "aws_ami" "expense_ami" {
  most_recent      = true
  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = ["973714476881"]

}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}