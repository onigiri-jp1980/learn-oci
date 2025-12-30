terraform {
  backend "s3" {
    # バックエンド設定は -backend-config オプションで指定
    # 例: -backend-config="bucket=your-bucket-name" -backend-config="region=ap-tokyo-1" -backend-config="endpoint=https://ap-tokyo-1.compat.objectstorage.ap-tokyo-1.oraclecloud.com"
    skip_region_validation  = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_metadata_api_check = true
  }
  required_providers {
    oci = {
      source = "oracle/oci"
      version = ">= 5.0.0"
    }
  }
}

provider "oci" {
  region = var.region
  tenancy_ocid = var.tenancy_ocid
}

resource "oci_objectstorage_bucket" "sample" {
  compartment_id = var.compartment_id
  name = "sample"
  namespace = var.os_namespace
}