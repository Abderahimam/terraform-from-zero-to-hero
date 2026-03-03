variable "prefix" {}
variable "region" {
    type = string 
    default = "Poland Central"
    description = "The region where the resources will be created"
    validation {
        condition = contains(["UK South", "UK West", "North Europe", "West Europe", "Poland Central"], var.region)
        error_message = "The region must be one of the following: UK South, UK West, North Europe, West Europe, Poland Central"
    }
}

variable "tags" {
    type = map(any)
    description = "A map of tags"
}
