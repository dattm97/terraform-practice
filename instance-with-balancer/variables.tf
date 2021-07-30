# Set number of instance
variable "app_names" {
  type    = set(string)
  default = ["app-1", "app-2"]
}

variable "awsprops" {
  type = map(string)
  default = {
    region       = "us-west-2"
    ami          = "ami-083ac7c7ecf9bb9b0"
    type         = "t2.micro"
    publicip     = true
    secgroupname = "IAC-Sec-Group"
  }
}

variable "vpc_cidr" {
  default = "172.31.0.0/16"
}

variable "network_http" {
  default = {
    subnet_name = "subnet_http"
    cidr        = "172.31.32.0/20"
  }
}
