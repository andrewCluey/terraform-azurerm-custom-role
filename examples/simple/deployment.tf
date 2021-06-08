provider "azurerm" {
  features {}
}


# Define the custom roles to create. 
# Each block under 'custom_role_definitions' will create a specific role.

module "new_roles" {
  for_each = local.custom_role_definitions
  source = "../../"

  role_name       = each.key
  role_definition = each.value
}
