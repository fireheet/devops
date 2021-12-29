module "rabbitmq_service" {
  source                 = "./modules/rabbitmq"
  rabbitmq_erlang_cookie = var.rabbitmq_erlang_cookie
  rabbitmq_default_user  = var.rabbitmq_default_user
  rabbitmq_default_pass  = var.rabbitmq_default_pass
  rabbitmq_default_vhost = var.rabbitmq_default_vhost
}

module "postgres_service" {
  source             = "./modules/postgres"
  postgres_data_path = var.postgres_data_path
  postgres_user      = var.postgres_user
  postgres_pass      = var.postgres_pass
  postgres_db_name   = var.postgres_db_name
}
