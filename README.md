# auth0-terraform-multi-tenant
Multi Tenant Terraform Setup with shared modules

This Repository contains a multi tenant auth0 Setup. 

Each tenant is configured in its own module. The root module initiates all the tenant modules and provides the auth0 provider to them. Each tenant gets a own provider with an alias pointing to another tenant.

Shared modules are located in the shared folder. The usage of shared modules allowes for standard tenant setup enforcement - additionally every tenant can then implement specifics with the resources directly.

How to run this example:

1. Create three auth0 tenants - in every tenant create a M2M Application with Management API Scopes and note the Client_id And Client_Secret as also the Tenant Domain
2. Copy the ```settings.tfvars.example``` file into a ```settings.tfvars``` file and fill in the variables
3. Run ```terraform init```
4. Run ```terraform apply -var-file="{yourSettingsFile}```
