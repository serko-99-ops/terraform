# Creating a New Key
resource "aws_key_pair" "Key-Pair" {

  # Name of the Key
  key_name   = "new_key1"

  # Adding the SSH authorized key !
  public_key = file("~/.ssh/new_key.pub")
  
 }
