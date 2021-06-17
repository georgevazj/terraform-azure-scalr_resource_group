variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group. Changing this forces a new resource to be created"
}
variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the Resource Group exists. Changing this forces a new resource to be created."
}
variable "cost_center" {
  type        = string
  description = "(Required)This tag will report the cost center of the resource and need to be applied to every resource in the subscription"
}
variable "product" {
  type        = string
  description = "(Required) The product tag will indicate the product to which the associated resource belongs to"
}

variable "cia" {
  type        = string
  description = "(Required) Confidentiality-Integrity-Availability"
}