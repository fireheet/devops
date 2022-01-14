terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "null_resource" "create_dev_folder" {
  provisioner "local-exec" {
    command = "echo '${var.sudo_password}' | sudo mkdir -p ${var.users_service_path}"
  }

  # Make the current user the owner of the users service folder
  provisioner "local-exec" {
    command = "echo '${var.sudo_password}' | sudo chown -R $USER ${var.users_service_path}"
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "users_service_dev_image" {
  name = "fireheet/dev-env:latest"
}

resource "docker_network" "create_fireheet_net" {
  name = var.fireheet_net_name
}

# Create a container
resource "docker_container" "users_service_dev" {
  image       = docker_image.users_service_dev_image.latest
  name        = "users_svc_dev"
  cpu_set     = "0-2"
  memory      = var.users_service_max_memory
  memory_swap = var.users_service_max_swap_memory
  user        = var.users_service_default_user
  env         = ["USERS_SVC_PATH=${var.users_service_path}"]

  volumes {
    container_path = "/app"
    host_path      = var.users_service_path
  }

  networks_advanced {
    name = docker_network.create_fireheet_net.name
  }

  ports {
    internal = 3000
    external = 3000
  }
}

