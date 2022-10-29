# Specific provider name according to the use case has to given!
terraform  {  
  required_providers   {    
  aws =    {      
   source = "hashicorp/aws"       
   version = "~> 3.27"   
   }
  }
}

provider "aws" {
  
  # Write the region name below in which your environment has to be deployed!
  region = "us-west-2"

  # Assign the profile name here!
  profile = "default"
}
