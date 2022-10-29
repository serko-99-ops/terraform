# Creating a VPC!
resource "aws_vpc" "my-vpc" {
  
  # IP Range for the VPC
  cidr_block = "10.0.0.0/16"
  
  # Enabling automatic hostname assigning
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

