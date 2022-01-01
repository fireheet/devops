output "users_service_api_url" {
  value = "http://localhost:${docker_container.users_service_dev.ports[0].external}"
}

output "docker_container_names" {
  value = [
    docker_container.users_service_dev.name,
    module.rabbitmq_service.container_name,
    module.postgres_service.container_name,
    module.redis_service.container_name
  ]
}

output "docker_container_ips" {
  value = [
    docker_container.users_service_dev.ip_address,
    module.rabbitmq_service.container_ip,
    module.postgres_service.container_ip,
    module.redis_service.container_ip
  ]
}

output "test" {
  value = docker_container.users_service_dev.ip_address
}

output "rabbitmq_container" {
  value = module.rabbitmq_service.rabbitmq_info
}

output "postgres_container" {
  value = module.postgres_service.postgres_info
}

output "redis_container" {
  value = module.redis_service.redis_info
}
