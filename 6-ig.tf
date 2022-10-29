# Creating an Internet Gateway for the VPC
resource "aws_internet_gateway" "Internet_Gateway" {
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_subnet.subnet3,
    aws_subnet.subnet4

  ]
  
  # VPC in which it has to be created!
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "IG-Public-&-Private-VPC"
  }
}
