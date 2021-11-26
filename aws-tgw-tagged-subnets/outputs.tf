output "aws_tagged_subnet_ids" {
    value = "${data.aws_subnets.this.ids}"
}