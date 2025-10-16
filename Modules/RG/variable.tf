variable "rg_names" {
  type = map(object({
    name       = string
    location   = string
    managedyBy = optional(string)
    tags       = optional(map(string))
  }))
} 