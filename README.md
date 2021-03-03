# terraform-azurerm-custom-role
Create custom roles for Azure AD


## Example
```hcl
data "azurerm_subscription" "non_prod" {}

locals {
custom_role_definitions = {
    projectA-createRG = {
      name        = "ROLE-Create-RG"
      description = "Role that assigns READER rights to Subscription xxx AND rights to create Resource Groups"
      scope       = data.azurerm_subscription.non_prod.id
      permissions = {
        actions = [
          "*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/write"
        ]
      }
      
      assignable_scopes = [
        data.azurerm_subscription.non_prod.id
      ]
    }
}


module "custom-role" {
  source  = "andrewCluey/custom-role/azurerm"
  version = "0.0.2"
  
  role_definitions = local.custom_role_definitions
}




```
