resource "oci_artifacts_container_repository" "app" {
  compartment_id = var.compartment_id
  display_name   = var.repository_name
  is_public      = var.is_public
}

output "repository_id" {
  value = oci_artifacts_container_repository.app.id
}

output "repository_name" {
  value = oci_artifacts_container_repository.app.display_name
}
