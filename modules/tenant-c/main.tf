terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

module "mfa" {
  source = "../shared/mfa"
  mfa_policy = {
    webauthn      = true
    email         = false
    otp           = false
    recovery_code = false
  }
}

module "database" {
  source = "../shared/database"
  database_settings = {
    name                = "users"
    min_length          = 4
    password_dictionary = true
    password_history    = true
  }
}

module "attack_protection" {
  source = "../shared/attack-protection"
}

module "spa_app_c" {
  source = "../shared/application/spa"
  application_settings = {
    allowed_logout_urls = ["https://example.com/logout"]
    callbacks           = ["https://example.com/oidc"]
    name                = "application-c"
    web_origins         = ["https://example.com"]
  }
}

resource "auth0_connection_client" "users_spa_connection" {
  connection_id = module.database.database-id
  client_id     = module.spa_app_c.application-spa-id
}
