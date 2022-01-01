output "container_ip" {
  value = docker_container.postgres_db.ip_address
}

output "container_name" {
  value = docker_container.postgres_db.name
}

output "postgres_info" {
  value = [
    "DB Access    : localhost:${docker_container.postgres_db.ports[0].external}",
    "Default user    : ${var.postgres_user}",
    "Default password: ${var.postgres_pass}",
    "Container name  : ${docker_container.postgres_db.name}"
  ]
}
