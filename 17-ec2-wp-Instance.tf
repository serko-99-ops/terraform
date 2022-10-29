# Creating an AWS instance for the Webserver!
resource "aws_instance" "webserver" {
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_security_group.BH-SG,
    aws_security_group.DB-SG-SSH
  ]
  # AMI ID [I have used my custom AMI which has some softwares pre installed]
  ami = "ami-0d593311db5abb72b"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet1.id
  # Keyname and security group are obtained from the reference of their instances created above!
  # Here I am providing the name of the key which is already uploaded on the AWS console.
  key_name = "new_key1"
  # Security groups to use!
  vpc_security_group_ids = [aws_security_group.WS-SG.id]
  tags = {
   Name = "Webserver_From_Terraform"
  }
  # Installing required softwares into the system!
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/new_key")
    host = aws_instance.webserver.public_ip
  }
  # Code for installing the softwares!
  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo yum install php php-mysqlnd httpd -y",
        "wget https://wordpress.org/wordpress-6.0.3.tar.gz",
        "tar -xzf wordpress-6.0.3.tar.gz",
        "sudo cp -r wordpress /var/www/html/",
        "sudo chown -R apache.apache /var/www/html/",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo systemctl restart httpd"
    ]
  }
}
#Second webserver
# Creating an AWS instance for the Webserver!
resource "aws_instance" "webserver-2" {
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet3,
    aws_subnet.subnet4,
    aws_security_group.BH-SG,
    aws_security_group.DB-SG-SSH
  ]
  # AMI ID [I have used my custom AMI which has some softwares pre installed]
  ami = "ami-0d593311db5abb72b"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet3.id
  # Keyname and security group are obtained from the reference of their instanc>
  # Here I am providing the name of the key which is already uploaded on the AW>
  key_name = "new_key1"
  # Security groups to use!
  vpc_security_group_ids = [aws_security_group.WS-SG.id]
  tags = {
   Name = "Webserver_From_Terraform_2"
  }
  # Installing required softwares into the system!
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/new_key")
    host = aws_instance.webserver.public_ip
  }
  # Code for installing the softwares!
  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo yum install php php-mysqlnd httpd -y",
        "wget https://wordpress.org/wordpress-6.0.3.tar.gz",
        "tar -xzf wordpress-6.0.3.tar.gz",
        "sudo cp -r wordpress /var/www/html/",
        "sudo chown -R apache.apache /var/www/html/",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo systemctl restart httpd"
    ]
 }
}
