variable "database_settings" {
  type = object({
    name                = string
    min_length          = number
    password_dictionary = bool
    password_history    = bool
  })
  validation {
    condition     = var.database_settings.min_length >= 4 && var.database_settings.min_length <= 12
    error_message = "min_lenght must be between 4 and 12"
  }
}