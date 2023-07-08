resource "aws_instance" "web" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
}

resource "aws_ebs_volume" "web_volume" {
  size = 10
  availability_zone = "us-east-1a"
  tags = {

    Name = "Ebs volume"

  }
}

resource "aws_volume_attachment" "web_volume_attachment" {
  instance_id = aws_instance.web.id
  volume_id = aws_ebs_volume.web_volume.id
  device_name = "/dev/sda1"
}

resource "aws_kubernetes_cluster" "default" {
  name = "my-cluster"
}
