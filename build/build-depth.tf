variable "depth" {
  type    = number
  default = 10
}

resource "local_file" "depth" {
  content  = templatefile("${path.module}/../depth.tmpl", { max_depth = var.depth })
  filename = "${path.module}/../depth.tf"
}
