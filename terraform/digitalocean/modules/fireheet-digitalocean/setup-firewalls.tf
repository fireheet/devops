resource "digitalocean_firewall" "fheet-firewall" {
  name = "fheet-firewall"

  droplet_ids = [digitalocean_droplet.new_fheet_droplet_0001.id]

  # Custom rules

  # Kibana dashboard
  inbound_rule {
    protocol         = "tcp"
    port_range       = "5601"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  # Elastic Stack ports
  inbound_rule {
    protocol         = "tcp"
    port_range       = "5000"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "5044"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9200"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9300"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9600"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  # Postgres
  inbound_rule {
    protocol         = "tcp"
    port_range       = "5432"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  # Default rules
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
