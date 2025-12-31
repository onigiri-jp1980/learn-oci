resource "oci_core_vcn" "sample" {
    compartment_id = var.compartment_id
    display_name = var.vcn_name
    cidr_blocks = var.vcn_cidr_blocks
    dns_label = var.vcn_dns_label
}

resource "oci_core_subnet" "sample" {
    compartment_id = var.compartment_id
    display_name = var.subnet_name
    cidr_block = var.subnet_cidr_blocks[0]
    dns_label = var.subnet_dns_label
    vcn_id = oci_core_vcn.sample.id
}

resource "oci_core_internet_gateway" "sample" {
    compartment_id = var.compartment_id
    display_name = var.internet_gateway_name
    vcn_id = oci_core_vcn.sample.id
}

resource "oci_core_route_table" "sample" {
    compartment_id = var.compartment_id
    display_name = var.route_table_name
    vcn_id = oci_core_vcn.sample.id
    route_rules {
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_internet_gateway.sample.id
    }
}

