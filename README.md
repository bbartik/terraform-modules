# Summary

This repo contains Terraform modules I created for learning and demo purpose. Some of them use tags to filter the available resources, such as "owner". 

# What they do

**aws-tgw-tagged-subnets:** creates one /28 subnet per AZ in a VPC and tags them with the value "attach_to_tgw:true" \
**aws-tgw-attachment:** returns a list of subnet ids based on the above tag and uses them in the TGW attachment \

# Usage

```
module "aws_tgw_tagged_subnets" {
  source = "git::https://github.com/bbartik/terraform-modules.git/aws-tgw-tagged-subnets"

  owner = "bbartik"
  cidr_block = "10.50.255.0/24"
  base_tag = "BB-Terraform-Lab"
}
```

```
module "aws_tgw_attachment" {
  source = "git::https://github.com/bbartik/terraform-modules.git/aws-tgw-attachment"

  owner = "bbartik"
  base_tag = "BB-Terraform-Lab"
}
```

