variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
default = "eu-west-1"
}
variable "private_key"{
default = "mykey"
} 
variable "public_key"{ 
default = "mykey.pub" 
} 
variable "username" {} 
variable "password" {}
variable "instance_type" {}
variable "availability_zone" {}