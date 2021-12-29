output "users_service_api_url" {
  value = "http://${docker_container.users_service_dev_env.gateway}:${docker_container.users_service_dev_env.ports[0].external}"
}

output "docker_ips" {
  value = [
    { rabbitmq = "${module.rabbitmq_service.container_ip}" },
    { users_service = "${docker_container.users_service_dev_env.gateway}" }
  ]
}

output "service_ips" {
  value = [
    "${docker_container.users_service_dev_env.gateway}"
  ]
}

output "test" {
  value = module.rabbitmq_service.container_ip
}
