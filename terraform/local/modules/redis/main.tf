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
resource "docker_image" "redis_image" {
  name = "redis:6.2-alpine"
}

# Create a container
resource "docker_container" "redis_db" {
  image       = docker_image.redis_image.latest
  name        = "redis_db"
  memory      = 250
  memory_swap = 400

  env = ["ALLOW_EMPTY_PASSWORD=yes"]

  networks_advanced {
    name = data.docker_network.fireheet_net.name
  }

  ports {
    internal = 6379
    external = 6379
  }
}
