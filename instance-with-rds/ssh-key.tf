# Define ssh to config in instance

# Create default ssh publique key
resource "aws_key_pair" "deployer" {
  key_name   = "terraform_deployer"
  public_key = file(var.public_key_path)
}
