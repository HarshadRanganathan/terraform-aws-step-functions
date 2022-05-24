variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  default     = null
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `alpha`, `stage`)"
  default     = null
}

variable "sf_name" {
  type        = string
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
  default     = null
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply. We recommend `private` to avoid exposing sensitive information"
  default     = null
}

variable "force_destroy" {
  type        = bool
  description = "A bool string that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = false
}

variable "kafka_bootstrap_servers" {
  type        = string
  description = "This variable is used to set the kafka bootstrap servers to pass the param to publish the kafka messages"
  default     = null
}


variable "enabled" {
  type        = bool
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}


variable "vpc_subnet_1" {
  type        = string
  default     = ""
  description = "name of vpc subnet"
}

variable "vpc_subnet_2" {
  type        = string
  default     = ""
  description = "name of vpc subnet"
}

variable "vpc_subnet_3" {
  type        = string
  default     = ""
  description = "name of vpc subnet"
}

// Template Variables

variable "template_file_name" {
  type        = string
  default     = ""
  description = "name of stepfunction template"
}

variable "emr_name" {
  type        = string
  default     = ""
  description = "EMR Cluster Name Used under stepfunction template for logs"
}
