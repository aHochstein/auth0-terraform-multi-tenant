terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

resource "auth0_attack_protection" "attack_protection" {
  suspicious_ip_throttling {
    enabled = true
    shields = ["admin_notification", "block"]

    pre_login {
      max_attempts = 100
      rate         = 864000
    }

    pre_user_registration {
      max_attempts = 50
      rate         = 1200
    }
  }

  brute_force_protection {
    enabled      = true
    max_attempts = 5
    mode         = "count_per_identifier_and_ip"
    shields      = ["block", "user_notification"]
  }


  breached_password_detection {
    admin_notification_frequency = ["daily"]
    enabled                      = true
    method                       = "standard"
    shields                      = ["admin_notification", "block"]

    pre_user_registration {
      shields = ["block"]
    }
  }
}