terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

data "docker_network" "fireheet_net" {
  name = "fireheet_net"
}

# Pulls the image
resource "docker_image" "postgres_image" {
  name = "postgres:14.1"
}

# Create a container
resource "docker_container" "postgres_db" {
  image       = docker_image.postgres_image.latest
  name        = "postgres_db"
  memory      = 500
  memory_swap = 1000

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_pass}",
    "POSTGRES_DB=${var.postgres_db_name}",
    "PGDATA=/var/lib/postgresql/data/pgdata",
  ]

  volumes {
    container_path = "/var/lib/postgresql/data/pgdata"
    host_path      = var.postgres_data_path
  }

  networks_advanced {
    name = data.docker_network.fireheet_net.name
  }

  ports {
    internal = 5432
    external = 5432
  }
}
