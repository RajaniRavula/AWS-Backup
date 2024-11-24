resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a"
  size              = 10

  tags = {
    Name = "HelloWorld"
  }
}