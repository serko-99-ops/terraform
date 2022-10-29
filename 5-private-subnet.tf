# Creating Private subnets!
resource "aws_subnet" "subnet2" {
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet1
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my-vpc.id
  
  # IP Range of this subnet
  cidr_block = "10.0.1.0/24"
  
  # Data Center of this subnet.
  availability_zone = "us-west-2a"
  
  tags = {
    Name = "Private Subnet"
  }
}
resource "aws_subnet" "subnet4" {
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet1
  ]

  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my-vpc.id

  # IP Range of this subnet
  cidr_block = "10.0.3.0/24"

  # Data Center of this subnet.
  availability_zone = "us-west-2b"

  tags = {
    Name = "Private Subnet Second"
  }
}

