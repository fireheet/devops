# RabbitMQ Env variables
variable "rabbitmq_erlang_cookie" {}
variable "rabbitmq_default_user" {}
variable "rabbitmq_default_pass" {}
variable "rabbitmq_default_vhost" {}

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
