variable "owner" {
  description = "Owner of the resource for tagging/filtering purposes"
}

variable "base_tag" {
  description = "Base tag used for naming purposes"
}

variable "vpc_id" {
  description = "VPC ID to be attached"
  default = ""
}

variable "subnet_ids" {
  description = "Subnet IDs to be attached"
  default = []
}