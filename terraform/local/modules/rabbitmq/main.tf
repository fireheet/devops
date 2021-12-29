terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}


# Pulls the image
resource "docker_image" "rabbitmq_service" {
  name = "rabbitmq:3-management"
}

# Create a container
resource "docker_container" "rabbitmq" {
  image       = docker_image.rabbitmq_service.latest
  name        = "rabbitmq"
  memory      = 200
  memory_swap = 350

  env = [
    "RABBITMQ_DEFAULT_VHOST=${var.RABBITMQ_DEFAULT_VHOST}",
    "RABBITMQ_ERLANG_COOKIE=${var.RABBITMQ_ERLANG_COOKIE}",
    "RABBITMQ_DEFAULT_USER=${var.RABBITMQ_DEFAULT_USER}",
    "RABBITMQ_DEFAULT_PASS=${var.RABBITMQ_DEFAULT_PASS}",
  ]

  ports {
    internal = 15672
    external = 15672
  }
}
