provider "azurerm" {
  features {}
}

# Lookup the subscription where the custom roles should be scoped to.
# If data lookup is left blank then subscription from current session is used.

data "azurerm_subscription" "current" {}

# Define the custom roles to create. 
# Each block under 'custom_role_definitions' will create a specific role.

module "new_roles" {
  for_each = local.custom_role_definitions
  source = "../../"

  role_name       = each.key
  role_definition = each.value
}
