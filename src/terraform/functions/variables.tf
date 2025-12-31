variable "region" {
  type = string
  description = "The region to deploy the resources to"
}

variable "tenancy_ocid" {
  type = string
  description = "The tenancy OCID"
}

variable "compartment_id" {
  type = string
  description = "The compartment OCID"
}

variable "application_name" {
  type = string
  description = "The name of the application"
  default = "sample"
}

variable "vcn_name" {
  type = string
  description = "Name of the VCN"
  default = "sample"
}

variable "vcn_cidr_blocks" {
  type = list(string)
  description = "The CIDR blocks of the VCN"
  default = ["10.0.0.0/16"]
}

variable "vcn_dns_label" {
  type = string
  description = "The DNS label of the VCN"
  default = "sample"
}

variable "subnet_name" {
  type = string
  description = "Name of the subnet"
  default = "sample-subnet"
}

variable "subnet_cidr_blocks" {
  type = list(string)
  description = "The CIDR blocks of the subnet"
  default = ["10.0.0.0/24"]
}

variable "subnet_dns_label" {
  type = string
  description = "The DNS label of the subnet"
  default = "samplesubnet"
}


variable "internet_gateway_name" {
  type = string
  description = "Name of the internet gateway"
  default = "sample-internet-gateway"
}

variable "route_table_name" {
  type = string
  description = "Name of the route table"
  default = "sample-route-table"
}

variable "repository_name" {
  type = string
  description = "Name of the repository"
  default = "sample-repository"
}

variable "is_public" {
  type = bool
  description = "Whether the repository is public"
  default = false
}