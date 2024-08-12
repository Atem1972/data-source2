provider "aws" {
    region = "us-east-1"
  
}

/*data "aws_instance" "dev" {

  instance_id = "i-054d428c6ea152799"  # this block help us to pull inform from aws instance that we created manually
}                                      # this instance id i copy it manually and past here . with this i can pull key name, securty-group etc

#bellow are the resouce i want terraform to use data source and pull for me
resource "aws_instance" "server1" {
  ami = data.aws_instance.dev.ami
  instance_type = data.aws_instance.dev.instance_type
  availability_zone = data.aws_instance.dev.availability_zone
  security_groups = data.aws_instance.dev.security_groups
  key_name = data.aws_instance.dev.key_name
  
}
*/
 

 # this will pull the ami from aws and we can use it to create instance
data "aws_ami" "example" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["my-ami-*"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
}