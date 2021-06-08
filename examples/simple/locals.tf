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
    subscriptionReader = {
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