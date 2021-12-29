output "container_ip" {
  value = docker_container.rabbitmq.gateway
}

output "container_name" {
  value = docker_container.rabbitmq.name
}

output "rabbitmq_info" {
  value = [
    "Panel Access    : http://localhost:${docker_container.rabbitmq.ports[0].external}",
    "Default user    : ${var.rabbitmq_default_user}",
    "Default password: ${var.rabbitmq_default_pass}",
    "Container name  : ${docker_container.rabbitmq.name}"
  ]

}
