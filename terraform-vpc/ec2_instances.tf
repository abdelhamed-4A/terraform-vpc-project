# EC2 Instance in the Public Subnet
resource "aws_instance" "public_ec2" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (change as needed)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_ec2.id] # Use vpc_security_group_ids instead of security_groups
  key_name               = aws_key_pair.my_key.key_name       # Reference the key pair

  tags = {
    Name = "public-ec2-instance"
  }
}

# EC2 Instance in the Private Subnet (Apache)
resource "aws_instance" "private_ec2" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (change as needed)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_ec2.id] # Use vpc_security_group_ids instead of security_groups
  key_name               = aws_key_pair.my_key.key_name        # Reference the key pair

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from the private subnet!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "private-ec2-instance"
  }
}