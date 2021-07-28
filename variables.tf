variable "instance_name" {
  # description = "Value of the Name tag for the EC2 instance"
  # type        = string
  # default     = "ExampleAppServerInstance"
  type = map(string)
  default = {
    name        = "ExampleAppServerInstance"
    environment = "DEV"
  }
}


variable "awsprops" {
  type = map(string)
  default = {
    region       = "us-west-2"
    vpc          = "vpc-a56c6cdd"
    ami          = "ami-083ac7c7ecf9bb9b0"
    type         = "t2.micro"
    subnet       = "subnet-4adb4632"
    publicip     = true
    secgroupname = "IAC-Sec-Group"
  }
}
