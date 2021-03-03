resource "azurerm_role_definition" "custom_role" {
  for_each = var.role_definitions

  name        = each.value.name
  scope       = each.value.scope
  description = each.value.description

  permissions {
    actions          = lookup(each.value.permissions, "actions", [])
    not_actions      = lookup(each.value.permissions, "not_actions", [])
    data_actions     = lookup(each.value.permissions, "data_actions", [])
    not_data_actions = lookup(each.value.permissions, "not_data_actions", [])
  }

  assignable_scopes = [each.value.scope]
}

variable "role_definitions" {}
