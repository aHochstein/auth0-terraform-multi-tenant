terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.45.0" # Refer to docs for latest version
    }
  }
}

provider "auth0" {
  alias         = "tenant-a"
  domain        = var.tenant-a.domain
  client_id     = var.tenant-a.client_id
  client_secret = var.tenant-a.client_secret
}

provider "auth0" {
  alias         = "tenant-b"
  domain        = var.tenant-b.domain
  client_id     = var.tenant-b.client_id
  client_secret = var.tenant-b.client_secret
}


provider "auth0" {
  alias         = "tenant-c"
  domain        = var.tenant-c.domain
  client_id     = var.tenant-c.client_id
  client_secret = var.tenant-c.client_secret
}

module "tenant-a" {
  source = "./modules/tenant-a"
  providers = {
    auth0 = auth0.tenant-a
  }
}

module "tenant-b" {
  source = "./modules/tenant-b"
  providers = {
    auth0 = auth0.tenant-b
  }
}

module "tenant-c" {
  source = "./modules/tenant-c"
  providers = {
    auth0 = auth0.tenant-c
  }
}

