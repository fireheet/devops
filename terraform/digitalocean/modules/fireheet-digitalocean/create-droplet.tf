resource "digitalocean_ssh_key" "fheet_key" {
  name       = "Fireheet Key"
  public_key = "${file("${path.module}/keys/fheet.pub")}"
}

resource "digitalocean_tag" "fheet_tag" {
  name = "fireheet-testing"
}

resource "digitalocean_droplet" "new_fheet_droplet_0001" {
  name   = "fheet-droplet-0001"
  size   = "s-2vcpu-4gb"
  image  = "ubuntu-18-04-x64"
  region = "nyc3"
  vpc_uuid = digitalocean_vpc.fheet_new_vpc_0001.id
  ssh_keys = [digitalocean_ssh_key.fheet_key.id]
  tags = [digitalocean_tag.fheet_tag.id]
}

output "droplet_id" {
  value = digitalocean_droplet.new_fheet_droplet_0001.id
}