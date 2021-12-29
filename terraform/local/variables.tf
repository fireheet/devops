# RabbitMQ Env variables
variable "RABBITMQ_ERLANG_COOKIE" {}
variable "RABBITMQ_DEFAULT_USER" {}
variable "RABBITMQ_DEFAULT_PASS" {}
variable "RABBITMQ_DEFAULT_VHOST" {}

variable "fireheet_net_name" {
  default = "fireheet_net"
}

variable "users_service_path" {
  default = "/home/dev/fireheet/users"
}

variable "users_service_path_var_name" {
  default = "USERS_SVC_PATH"
}

variable "users_service_max_memory" {
  default = 1000
}

variable "users_service_max_swap_memory" {
  default = 1500
}

variable "users_service_default_user" {
  default = "node"
}
