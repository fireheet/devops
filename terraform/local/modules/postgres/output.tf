output "postgres_url" {
  value = docker_container.postgres_db.gateway
}

output "postgres_info" {
  value = [
    "DB Access    : localhost:${docker_container.postgres_db.ports[0].external}",
    "Default user    : ${var.postgres_user}",
    "Default password: ${var.postgres_pass}",
    "Container name  : ${docker_container.postgres_db.name}"
  ]
}
