output "vpc_id" {
  value = "${aws_vpc.drift_root_vpc.id}"
}

output "route_table_id" {
  value = "${aws_vpc.drift_root_vpc.main_route_table_id}"
}

output "ig_id" {
  value = "${aws_internet_gateway.drift_root_ig.id}"
}

output "subnet_id" {
  value = "${aws_subnet.drift_web_subnet.id}"
}

output "vpc_security_group_ids" {
  value = "${aws_security_group.drift_web_sg.id}"
}

#output "key_id" {
#  value = "${aws_key_pair.auth.id}"
#}
