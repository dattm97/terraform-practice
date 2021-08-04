amis = {
  "eu-west-1" = "ami-e487179d"
}
autoscaling_group_max_size = 5
autoscaling_group_min_size = 3
database_name              = "terraform_test_db"
database_user              = "terraform"
instance_type              = "t2.micro"
rds_instance_identifier    = "terraform-mysql"
region                     = "eu-west-1"
s3_bucket_name             = "springboot-s3-example"
allowed_cidr_blocks        = ["0.0.0.0/0"]
database_password          = "terraform01"
public_key_path            = "~/.ssh/id_rsa.pub"
