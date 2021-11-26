data "aws_availability_zones" "this" {
  state = "available"
}

data "aws_vpc" "this" {
  filter {
    name   = "tag:owner"
    values = ["${var.owner}"]
  }
}

resource "aws_subnet" "tagged_subnets" {
  count                   = length(data.aws_availability_zones.this.names)
  vpc_id                  = data.aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone       = data.aws_availability_zones.this.names[count.index]

  tags = {
    Name = "${var.base_tag}-TGW-${data.aws_availability_zones.this.names[count.index]}" 
    attach_to_tgw = "true"
  }
}

data "aws_subnets" "this" {
  filter {
    name   = "tag:attach_to_tgw"
    values = ["true"]
  }
}

