terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

resource "auth0_guardian" "mfa_settings" {
  policy        = "all-applications"
  email         = var.mfa_policy.email
  otp           = var.mfa_policy.otp
  recovery_code = var.mfa_policy.recovery_code

  webauthn_platform {
    enabled = var.mfa_policy.webauthn
  }

  webauthn_roaming {
    enabled           = var.mfa_policy.webauthn
    user_verification = "required"
  }
}