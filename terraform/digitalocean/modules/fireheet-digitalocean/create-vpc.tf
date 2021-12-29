resource "digitalocean_vpc" "fheet_new_vpc_0001" {
  name     = "fireheet-vpc-0001"
  region   = "nyc3"
  ip_range = "10.10.10.0/24"
}