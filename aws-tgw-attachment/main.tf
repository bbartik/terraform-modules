data "aws_ec2_transit_gateway" "this" {
  filter {
    name   = "tag:owner"
    values = ["${var.owner}"]
  }
}

data "aws_vpc" "this" {
  filter {
    name   = "tag:owner"
    values = ["${var.owner}"]
  }
}

data "aws_subnets" "this" {
  filter {
    name   = "tag:attach_to_tgw"
    values = ["true"]
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = data.aws_subnets.this.ids
  transit_gateway_id = data.aws_ec2_transit_gateway.this.id
  vpc_id             = data.aws_vpc.this.id

  tags = {
    Name = "${var.base_tag}-TGW"
  }
}

