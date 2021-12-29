output "users_service_api_url" {
  value = "http://localhost:${docker_container.users_service_dev.ports[0].external}"
}

output "docker_container_names" {
  value = [
    module.rabbitmq_service.container_name,
    docker_container.users_service_dev.name
  ]
}

output "rabbitmq_container" {
  value = module.rabbitmq_service.rabbitmq_info
}

output "postgres_container" {
  value = module.postgres_service.postgres_info
}
