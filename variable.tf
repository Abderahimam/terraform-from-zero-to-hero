
variable "prefix" {
  type        = string
  description = "A prefix for all resources"
  default     = "redbull"
}

variable "region" {
  type        = string
  default     = "polandcentral"
  description = "The azure region to deploy the resources"
  validation {
    condition     = contains(["UK South", "UK West","polandcentral", "North Europe", "West Europe", "East US", "West US"], var.region)
    error_message = "The region must be one of the following: UK South, UK West, North Europe, West Europe, East US, West US"
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of tags"
}

variable "resource_groups" {
  type = map(string)
}

variable "virtual_networks" {
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
    subnets = map(object({
      name           = optional(string)
      address_prefix = string

    }))
  }))
  description = "the virtual networks to deploy "

}