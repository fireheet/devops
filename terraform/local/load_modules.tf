module "rabbitmq_service" {
  source                 = "./modules/rabbitmq"
  rabbitmq_erlang_cookie = var.rabbitmq_erlang_cookie
  rabbitmq_default_user  = var.rabbitmq_default_user
  rabbitmq_default_pass  = var.rabbitmq_default_pass
  rabbitmq_default_vhost = var.rabbitmq_default_vhost
}
