# Summary

This module is for creating subnets in an AWS VPCs and tagging them with the value "attach_to_tgw" for later use by the TGW attachment module. It pulls a list of AZs in the region of your provider, then creates one /28 subnet in each AZ using the CIDR block you specify.

# Usage

Import the module as follows and specify the owner, base_tag and cidr_bock parms.

This example will look for the VPC tagged with "owner:bbartik" and create 1 subnet per AZ in the 10.50.255.0/24 block and tag it with "attach_to_tgw".

NOTE: Make sure you define your vars files as well.

```
terraform {
	backend "remote" {
		organization = "bbartik"
		workspaces {
			name = "aws-tgw-tagged-subnets"
    }
  }
}

provider "aws" {
  region  = var.region
	access_key = var.aws_access_key_id
	secret_key = var.aws_secret_access_key

  default_tags {
    tags = {
      owner = var.owner
      }
	}
}

module "aws_tgw_tagged_subnets" {
  source = "git::https://github.com/bbartik/aws-tgw-tagged-subnets.git"

  owner = "bbartik"
  cidr_block = "10.50.255.0/24"
  base_tag = "BB-Terraform-Lab"
}
```
