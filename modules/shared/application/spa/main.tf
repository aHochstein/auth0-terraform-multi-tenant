terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

resource "auth0_client" "spa" {
  name                       = var.application_settings.name
  description                = var.application_settings.name
  app_type                   = "spa"
  token_endpoint_auth_method = "none"
  is_first_party             = true
  grant_types = [
    "authorization_code"
  ]
  jwt_configuration {
    lifetime_in_seconds = 3000
    secret_encoded      = true
    alg                 = "RS256"
  }
  callbacks           = var.application_settings.callbacks
  allowed_logout_urls = var.application_settings.allowed_logout_urls
  web_origins         = var.application_settings.web_origins
}

output "application-spa-id" {
  value = auth0_client.spa.id
}

output "application-spa-name" {
  value = auth0_client.spa.name
}