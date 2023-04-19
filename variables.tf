variable "tenant-a" {
  type = object({
    domain        = string
    client_id     = string
    client_secret = string
  })
}

variable "tenant-b" {
  type = object({
    domain        = string
    client_id     = string
    client_secret = string
  })
}

variable "tenant-c" {
  type = object({
    domain        = string
    client_id     = string
    client_secret = string
  })
}