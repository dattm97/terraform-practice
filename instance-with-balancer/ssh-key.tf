# Define ssh to config in instance

# Create default ssh publique key
resource "aws_key_pair" "user_key" {
  key_name   = "key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDA2dE4RM3aNby9yzMTDzSIoTiYFOaDz6iuxkIMZlIYcVZ3TYfxLxQwNEIx9fgYaa99/osMyw5kY4dMciOi8gBXpM1uvgJFiOJ8EPAnpWefwFYJQLThgxf1UfmIOfg2+XKAnIFRJ14GBc1bwKgAYOnJ1j7j4Jtd3ECKf9rNO4mMII5yM+L6PxRO8DPlXcOZClkskWviRY4C+N6GmPtZFT7s61xpw2gfw2JWhppigQcCTf9JFjaY2Yb2OdlXC76PN0in9dl3zS+BH4QYWw9J2P5WkEsTC3/fNvFCjPylSh4x5ci1jQJuWwRL20SPDOWh3/q3Xhiueea9Ikh0G6s3iUoraj8ik1GorDrbIOEZjO4AYLvGQGmHRKC2BiWRXuuCIUdUIT+O8R9ISTtvR2ohjCl7thGS8hQaxiq0TM/zstX9FSUesqbJ6m++MunwormEaAwj4BSBYNrpB7tKbkpRbYe9eb1xglEgf0aVahsckFvhF3hRhDGl5893L1CRjPegpU0kuAvWc0yvk48PAYth+aXa3Hl1vKkGRla+cf9Sqz5zPLy3SU+7maT7XvCws2v7P8MMwhXOzxpQ2gD8Rez+Rai8BQeft/K6o4MrtuUcT7jhFYl8qTHUZLrhYoC6tS0wFDubvDBfeR2kcLULHkltaHFCsSSK6WiZdB77e2rF/zNhsQ== dattm@payme.vn"
}