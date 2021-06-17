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

variable "workload_acronym" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group. Changing this forces a new resource to be created"
}

variable "channel" {
  type = string
  description = "(Optional) Distribution channel to which the associated resource belongs to."
  default     = ""
}

variable "description" {
  type        = string
  description = "(Required) Provide additional context information describing the resource and its purpose."
}

variable "tracking_code" {
  type        = string
  description = "(Required) Allow this resource to be matched against internal inventory systems."
}

variable "sequence_number" {
  type = string
  description = "(Required) Sequence number for resources in WL."
}

variable "akv_sequence_number" {
  type        = string
  description = "(Optional) Key Vault sequence number."
  default     = ""
}

variable "sta_sequence_number" {
  type        = string
  description = "(Optional) Storage Account sequence number."
  default     = ""
}

variable "akv_key_sequence_number" {
  type        = string
  description = "(Optional) AKV Key sequence number which will be used to encrypt the Storage Account."
  default     = ""
}

variable "ip_rules" {
  type        = list
  description = "(Optional) The ranges of IPs to can access Key Vault"
  default = []
}

variable "virtual_network_subnet_ids" {
  type        = list
  description = "(Required) The Azure subnets that can access Key Vault"
  default = []
}

variable "delete_retention_days" {
  type        = number
  description = "(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7"
  default     = 7
}

variable "sta_tier" {
  type        = string
  description = "(Required) Storage account tier. Possible values: standard."
}

variable "sta_replication" {
  type        = string
  description = "(Required) Storage account replication policy. Possible values: LRS, GRS, RAGRS or ZRS "
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
