# auth0-terraform-multi-tenant
Multi Tenant Terraform Setup with shared modules

This Repository contains a multi tenant auth0 Setup. 
Shared modules are located in the shared folder. Additonally every tenant has its own module that uses shared modules and auth0 terraform resources directly.
The usage of shared modules allowes for standard tenant setup enforcement - additionally every tenant can then implement specifics with the resources directly.

How to run this example:

1. Create three auth0 tenants - in every tenant create a M2M Application with Management API Scopes and note the Client_id And Client_Secret as also the Tenant Domain
2. Create a .tfvars file for the variables tenant_a, tenant_b and tenant_c
3. Run ```terraform init```
4. Run ```terraform apply -var-file="{yourSettingsFile}```
