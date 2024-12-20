variable "name" {
  type        = string
  description = "Name to use for the image builder pipeline and components."
  default     = "imagebuilder-test"
  nullable    = false
}

variable "instance_types" {
  type        = list(string)
  description = "Instance type to use for the image builder instance."
  default     = ["t3.nano"]
  nullable    = false
}

variable "schedule_expression" {
  type        = string
  description = "CloudWatch event schedule expression"
  default     = null
  nullable    = true
}

variable "image_export_format" {
  type        = string
  description = "Image format to do the initial AMI export to."
  default     = "vmdk"
  validation {
    condition     = contains(["vmdk", "vhd", "raw"], var.image_export_format)
    error_message = "Image format needs to be one of these values: vmdk, vhd, raw"
  }
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to use for building the image. Needs to be able to connect to SSM."
  default     = null
  nullable    = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs to use for building the image. Needs to be able to connect to SSM."
  default     = null
  nullable    = true
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block to use for the VPC."
  default     = "10.0.0.0/16"
}
