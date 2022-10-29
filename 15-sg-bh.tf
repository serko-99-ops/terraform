# Creating security group for Bastion Host/Jump Box
resource "aws_security_group" "BH-SG" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_subnet.subnet3,
    aws_subnet.subnet4
  ]

  description = "MySQL Access only from the Webserver Instances!"
  name = "bastion-host-sg"
  vpc_id = aws_vpc.my-vpc.id

  # Created an inbound rule for Bastion Host SSH
  ingress {
    description = "Bastion Host SG"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output from Bastion Host"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
