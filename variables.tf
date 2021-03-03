variable "role_definitions" {
  type = object({
    name        = string
    description = string
    scope       = string
    assignable_scopes = list(string)
    permissions = object({
      actions          = list(string)
      not_actions      = list(string)
      data_actions     = list(string)
      not_data_actions = list(string)
      })
    })
}
