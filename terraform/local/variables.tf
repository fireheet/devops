# RabbitMQ Env variables
variable "RABBITMQ_ERLANG_COOKIE" {}
variable "RABBITMQ_DEFAULT_USER" {}
variable "RABBITMQ_DEFAULT_PASS" {}
variable "RABBITMQ_DEFAULT_VHOST" {}

variable "fireheet_net_name" {
  default = "fireheet_net"
}

variable "users_service_path" {}
variable "users_service_container_name" {}
variable "users_service_path_var_name" {}
variable "users_service_container_var_name" {}
variable "users_service_max_memory" {}
variable "users_service_max_swap_memory" {}
variable "users_service_default_user" {}
