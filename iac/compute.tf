resource "aws_instance" "instance_a" {
  ami                    = "ami-0c94855ba95c71c99"  # Replace with your desired AMI
  instance_type          = "t2.micro"  # Replace with your desired instance type
  subnet_id              = aws_subnet.vpc_a_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg_a.id]
}

# Create an EC2 instance in VPC B
resource "aws_instance" "instance_b" {
  ami                    = "ami-0c94855ba95c71c99"  # Replace with your desired AMI
  instance_type          = "t2.micro"  # Replace with your desired instance type
  subnet_id              = aws_subnet.vpc_b_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg_b.id]
}

# Create an EC2 instance in VPC C
resource "aws_instance" "instance_c" {
  ami                    = "ami-0c94855ba95c71c99"  # Replace with your desired AMI
  instance_type          = "t2.micro"  # Replace with your desired instance type
  subnet_id              = aws_subnet.vpc_c_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg_c.id]
}