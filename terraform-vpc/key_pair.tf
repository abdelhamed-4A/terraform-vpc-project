resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"                                   # Name of the key pair
  public_key = file("/home/ec2-user/.ssh/my-key-pair.pem.pub") # Path to your public key file
}