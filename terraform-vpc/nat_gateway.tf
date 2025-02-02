# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc" # Use "vpc" for VPC-bound EIPs
}

# Create a NAT Gateway in the public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id       # Reference the EIP
  subnet_id     = aws_subnet.public.id # Reference the public subnet

  tags = {
    Name = "main-nat-gateway"
  }
}