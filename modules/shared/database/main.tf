terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

resource "auth0_connection" "database" {
  name                 = var.database_settings.name
  is_domain_connection = true
  strategy             = "auth0"
  options {
    enabled_database_customization = false
    disable_signup                 = false
    import_mode                    = false
    password_policy                = "excellent"
    password_complexity_options {
      min_length = var.database_settings.min_length
    }
    password_dictionary {
      enable = var.database_settings.password_dictionary
    }
    password_history {
      enable = var.database_settings.password_history
    }
  }
}

output "database-id" {
  value = auth0_connection.database.id
}

output "database-name" {
  value = auth0_connection.database.name
}