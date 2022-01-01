output "container_ip" {
  value = docker_container.redis_db.ip_address
}

output "container_name" {
  value = docker_container.redis_db.name
}

output "redis_info" {
  value = [
    "Panel Access    : http://localhost:${docker_container.redis_db.ports[0].external}",
    "Container name  : ${docker_container.redis_db.name}"
  ]

}
