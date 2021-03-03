# Lookup the subscription where the custom roles should be scoped to.
# If data lookup is left blank then subscription from current session is used.

data "azurerm_subscription" "current" {}

# Define the custom roles to create. 
# Each block under 'custom_role_definitions' will create a specific role.
locals {
custom_role_definitions = {
    createRG = {
      name        = "ROLE-Create-RG"
      description = "Role that assigns READER rights to Subscription xxx AND rights to create Resource Groups"
      scope       = data.azurerm_subscription.current.id
      permissions = {
        actions = [
          "*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/write"
        ]
      }
      
      assignable_scopes = [
        data.azurerm_subscription.current.id
      ]
    }
  subscriptionReader = {
      name        = "ROLE-subscription-Reader"
      description = "Role that assigns READER rights to Subscription xxx AND rights to create Resource Groups"
      scope       = data.azurerm_subscription.current.id
      permissions = {
        actions = [
          "*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/write"
        ]
      }
      
      assignable_scopes = [
        data.azurerm_subscription.current.id
      ]
    }
  # Add new roles here if required.
}


module "custom-role" {
  source  = "andrewCluey/custom-role/azurerm"
  version = "0.0.2"
  
  role_definitions = local.custom_role_definitions
}
