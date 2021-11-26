variable "owner" {
  description = "Owner of the resource for tagging/filtering purposes"
}

variable "base_tag" {
  description = "Base tag used for naming purposes"
}

variable "cidr_block" {
  description = "Subnet from your VPC used to create TGW attachment subnets"
}