# terraform-azurerm-custom-role
Create custom roles for Azure AD


## Overview
Roles are defined in an object. Either through an input or a local variable.

If more than one role needs to be created (which is likely), then multiple roles can be created by defining all the roles within the input/local variable and using a ```for_each``` loop within the module (see exmaple below).


## Example
```hcl
data "azurerm_subscription" "current" {}

locals {
  custom_role_definitions = {
    createRG = {
      description = "Role that assigns READER rights to Subscription xxx AND rights to create Resource Groups"
      scope       = data.azurerm_subscription.current.id
      
      permissions = {  
        actions = [
          "*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/write"
        ],
        not_actions      = [],
        data_actions     = [],
        not_data_actions = []
      }
      assignable_scopes = [
        data.azurerm_subscription.current.id
      ]
    }

  # Add new roles here if required.
  }

}

module "new_roles" {
  for_each = local.custom_role_definitions
  source = "../../"

  role_name       = each.key
  role_definition = each.value
}


output "subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "role_ids" {
  value = {
    for k, role in module.new_roles : k => role.role_id
  }
}

```
