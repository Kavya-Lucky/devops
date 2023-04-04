resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}


resource "aws_security_group" "project-iacsg" {
  name        = lookup(var.awsprops, "securitygroupname")
  description = lookup(var.awsprops, "securitygroupname")
  vpc_id      = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "project-iac" {
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "instance_type")
  subnet_id                   = lookup(var.awsprops, "subnet") #FFXsubnet2
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = lookup(var.awsprops, "keyname")



  vpc_security_group_ids = [
    aws_security_group.project-iacsg.id
  ]
  depends_on = [aws_security_group.project-iacsg]


  user_data = file("./userdata.sh")


  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
  tags = {
    Name        = "SERVER02"
    Environment = "DEV"
    OS          = "UBUNTU"
    Managed     = "IAC"


  }
}










 