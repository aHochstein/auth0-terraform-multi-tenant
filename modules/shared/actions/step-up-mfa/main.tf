terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

resource "auth0_action" "step_up_mfa" {
  name    = "step_up_mfa"
  runtime = "node16"
  deploy  = true
  code    = file("${path.module}/step_up_mfa.js")

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

output "step-up-action-id" {
  value = auth0_action.step_up_mfa.id
}

output "step-up-action-name" {
  value = auth0_action.step_up_mfa.name
}
