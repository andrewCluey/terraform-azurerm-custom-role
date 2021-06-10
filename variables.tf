variable "role_definition" {
  type = object({
    description       = string
    scope             = string
    assignable_scopes = list(string)
   
    permissions = object({
      actions        = list(string)
      notActions     = list(string)
      dataActions    = list(string)
      notDataActions = list(string)
      })
    })
}

variable "role_name" {
  type        = string
  description = "The name to assign to the new role definition."
}