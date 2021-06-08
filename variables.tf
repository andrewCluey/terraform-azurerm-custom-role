variable "role_definition" {
  type = object({
    description       = string
    scope             = string
    assignable_scopes = list(string)
   
    permissions = object({
      actions          = list(string)
      not_actions      = list(string)
      data_actions     = list(string)
      not_data_actions = list(string)
      })
    })
}

variable "role_name" {
  type        = string
  description = "The name to assign to the new role definition."
}