
output "subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "role_ids" {
  value = {
    for k, role in module.new_roles : k => role.role_id
  }
}