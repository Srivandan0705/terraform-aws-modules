provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "PublicEC2" {
  ami               = "ami-0c7217cdde317cfec"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = "keypair"
  tags = {
    Name = "PublicEC2"
  }
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.wp-sg.id]
  depends_on             = [aws_vpc.wp-vpc, aws_subnet.public_subnet]
}
resource "aws_instance" "PrivateEC2" {
  ami               = "ami-0c7217cdde317cfec"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = "keypair"
  tags = {
    Name = "PrivateEC2"
  }
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_wp-vpc.id]
  depends_on             = [aws_vpc.wp-vpc, aws_subnet.private_subnet]
}