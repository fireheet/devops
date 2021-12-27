resource "local_file" "example" {
  filename = "example.txt"
  content = var.message
}

variable "message" {}