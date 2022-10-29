# Creating Public subnet!
resource "aws_subnet" "subnet1" {
  depends_on = [
    aws_vpc.my-vpc
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my-vpc.id
  
  # IP Range of this subnet
  cidr_block = "10.0.0.0/24"
  
  # Data Center of this subnet.
  availability_zone = "us-west-2a"
  
  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}
#Creating second Public Subnet
resource "aws_subnet" "subnet3" {
  depends_on = [
    aws_vpc.my-vpc
#    aws_subnet.subnet1
  ]

  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my-vpc.id

  # IP Range of this subnet
  cidr_block = "10.0.2.0/24"

  # Data Center of this subnet.
  availability_zone = "us-west-2b"

  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet Second"
  }
}
