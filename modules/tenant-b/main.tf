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
    webauthn      = false
    email         = false
    otp           = true
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

module "spa_app_b" {
  source = "../shared/application/spa"
  application_settings = {
    allowed_logout_urls = ["https://example.com/logout"]
    callbacks           = ["https://example.com/oidc"]
    name                = "application-b"
    web_origins         = ["https://example.com"]
  }
}

resource "auth0_connection_client" "users_spa_connection" {
  connection_id = module.database.database-id
  client_id     = module.spa_app_b.application-spa-id
}

module "step_up_mfa" {
  source = "../shared/actions/step-up-mfa"
}

resource "auth0_trigger_binding" "login_flow" {
  trigger = "post-login"

  actions {
    id           = module.step_up_mfa.step-up-action-id
    display_name = module.step_up_mfa.step-up-action-name
  }
}

resource "auth0_branding" "my_brand" {
  colors {
    primary         = "#4bd600"
    page_background = "#000000"
  }
}
