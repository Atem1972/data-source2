

# here we are calling ami from ec2 instance
 # this data block we can use to pull the ami id from ec2
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# here we are using data source to call ami to creacte instance 
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# here we are calling ami from ec2 instance
#second block   this will pull ami id from aws and wi can use to create instance
data "aws_ami" "amz" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-ebs"]  # this will pull most recent
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}



# here we are using data source to call ami to creacte instance 
# to create amz ec2 instance
resource "aws_instance" "server2" {
  ami = data.aws_ami.amz.id
  instance_type = "t2-micro"
}
