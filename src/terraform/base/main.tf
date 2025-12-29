provider "oci" {
  region = var.region
  tenancy_ocid = var.tenancy_ocid
  compartment_id = var.compartment_id
  user_ocid = var.user_ocid
  key_file = var.key_file
  backend "s3" {
    bucket = var.backend_bucket
    key = "base/terraform.tfstate"
    region = var.region
    endpoint = "https://${var.region}.compat.objectstorage.${var.region}.oraclecloud.com"
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_metadata_api_check = true
  }
}
