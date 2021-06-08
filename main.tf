resource "azurerm_role_definition" "custom_role" {
  name        = var.role_name
  scope       = var.role_definition.scope
  description = var.role_definition.description

  permissions {
    actions          = lookup(var.role_definition.permissions, "actions", [])
    not_actions      = lookup(var.role_definition.permissions, "not_actions", [])
    data_actions     = lookup(var.role_definition.permissions, "data_actions", [])
    not_data_actions = lookup(var.role_definition.permissions, "not_data_actions", [])
  }

  assignable_scopes = lookup(var.role_definition, "assignable_scopes", [])
}

/*
output "id" {
  value = tomap({for k, v in azurerm_role_definition.custom_role : k => v.id})
}
*/