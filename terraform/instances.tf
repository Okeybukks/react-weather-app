resource "aws_instance" "weather-instance" {
  count                       = length(var.availability_zones)
  ami                         = "ami-0261755bbcb8c4a84"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  key_name                    = aws_key_pair.ssh-key.key_name
  user_data                   = file("applications.sh")

  tags = {
    Name = "weather-instance-${count.index + 1}"
  }

  depends_on = [
    aws_key_pair.ssh-key
  ]
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD46sw0xQd/M6ya2Tp0fRhgbsElK8pNHeyEiY4D34pQmhiQUirMlfW8lzhuQwo3BiksACwpXnXEcTaZQ63NfQdMmITb51aDyC74/4N1SbBeLQ0mevHp142XURFLNE9gNMqwQvDvem4guUgNVjawNJgUtVwlzLNP5X6u9P+IKaHCYwDHGEFE6EV8fpzC2hg82DPsYn0qw87FYaKXIuwVOkgEXn1JZR2qtBCEKOx7It57tXdW5SFQxHy/8bcqC53WEo3PkcFC09ktmt09Gjpw9RB3jZhPB4F7QaVKKMM+/VNAy9Q9FUyWPF3Ln6ZOhDLnfP7H1zDdaxUKTHubJpSaFoT2Y725LpTsehlQyJ6keJvdgkTWE3UTr0mtVMR0yOn1ZXogcACBtp4bF/8iPuDHaiVpODQKmU8ISEoJ4keNiSPx4OAYAMbiLq/h3B2GNNlokMqW82DP3a/iSauSnn82A9aDvEapOWdLcxP6wqKSVzLVZ0Xr7+4zRUSAeYMCLtviSJs= vagrant@vagrant"
}

