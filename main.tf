provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "nginx" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "Terraform-Nginx"
  }
}