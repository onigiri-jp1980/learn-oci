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

variable "user_ocid" {
  type = string
  description = "The user OCID"
}

variable "key_file" {
  type = string
  description = "The path to the key file"
}

variable "os_namespace" {
  type = string
  description = "The namespace of the object storage"
}

variable "backend_bucket" {
  type = string
  description = "The name of the bucket to store the state file"
}