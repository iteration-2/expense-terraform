resource "aws_instance" "instance" {
  ami                    = data.aws_ami.expense_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.component
  }
}

resource "null_resource" "ansible" {
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = var.ssh_user
      password = var.shh_pass
      host     = aws_instance.instance.public_ip
    }

    inline = [
      "sudo pip3.11 install ansible",
      "ansible-playbook -i localhost, -U https://github.com/iteration-2/expense-terraform.git expense.yml -e env=${var.env} -e role_name=${var.component}"
    ]
  }
}

resource "aws_route53_record" "record" {
  name    = "${var.component}-${var.env}"
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl = 30
}