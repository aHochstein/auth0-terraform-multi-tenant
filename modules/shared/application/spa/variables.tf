variable "application_settings" {
  type = object({
    name                = string
    callbacks           = list(string)
    allowed_logout_urls = list(string)
    web_origins         = list(string)
  })
}