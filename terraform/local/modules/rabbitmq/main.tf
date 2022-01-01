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
resource "docker_image" "rabbitmq_image" {
  name = "rabbitmq:3.9.11-management-alpine"
}

# Create a container
resource "docker_container" "rabbitmq" {
  image       = docker_image.rabbitmq_image.latest
  name        = "rabbitmq"
  memory      = 200
  memory_swap = 350

  env = [
    "RABBITMQ_CONFIG_FILE=/home/$USER/devops/terraform/local/modules/rabbitmq/rabbitmq-env.conf",
    "RABBITMQ_DEFAULT_VHOST=${var.rabbitmq_default_vhost}",
    "RABBITMQ_ERLANG_COOKIE=${var.rabbitmq_erlang_cookie}",
    "RABBITMQ_DEFAULT_USER=${var.rabbitmq_default_user}",
    "RABBITMQ_DEFAULT_PASS=${var.rabbitmq_default_pass}",
  ]

  networks_advanced {
    name = data.docker_network.fireheet_net.name
  }

  ports {
    internal = 15672
    external = 15672
  }
}
