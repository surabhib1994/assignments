
/*data "aws_ami" "Windows_2016" {
 filter {
	name = "is-public"
	values = ["false"]
        }
 filter {
	name = "name"
	values = ["windows2016Server*"]
		}
most_recent = true
owners           = ["*"]
}*/

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
 
data "template_file" "userdata" {
  template = "${file("userdata.tpl")}"
}

resource "aws_instance" "mediawikiserver" {
    ami = "ami-0088977e66ac3915d" #data.aws_ami.Windows_2016.image_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
	subnet_id = aws_subnet.mwsubnet.id
	key_name      = aws_key_pair.mykey.key_name
	network_interface {
	device_index         = 0
    network_interface_id = aws_network_interface.mwinterface.id
    }
	user_data = data.template_file.userdata.rendered
	vpc_security_group_ids = [aws_security_group.mwsg.id]
	 tags= {
	 Name = "mediawiki_server"
	 env = "dev"
	}
}  

resource "aws_vpc" "mwvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mediawiki_vpc"
	env = "dev"
  }
}

resource "aws_subnet" "mwsubnet" {
  vpc_id            = aws_vpc.mwvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "mediawiki_subnet"
	env = "dev"
  }
}

resource "aws_network_interface" "mwinterface" {
  subnet_id   = aws_subnet.mwsubnet.id
  private_ips = ["10.0.1.10"]

  tags = {
    Name = "mediawiki_primary_network_interface"
	env =  "dev"
  }
}

resource "aws_security_group" "mwsg" {
name = "test-sg"
vpc_id = "${aws_vpc.mwvpc.id}"
ingress {
    description = "RDP from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.mwvpc.cidr_block]
  }
ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
    Name = "mediawiki_sg"
	env =  "dev"
  }
}