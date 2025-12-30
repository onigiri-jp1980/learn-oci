from os import environ as env
from oci import (config,
    exceptions as oci_exceptions,
    object_storage as os,
    base_client as base,
)


def get_object_storage_client() -> os.ObjectStorageClient:
    return os.ObjectStorageClient(
        config=config.from_file(env.get("TF_VAR_key_file")),
        region=env.get("OCI_REGION"),
        tenancy_ocid=env.get("OCI_TENANCY_ID"),
        compartment_id=env.get("OCI_COMPARTMENT_ID"),
        user_ocid=env.get("OCI_USER_ID"),
    )


def get_namespace(client: os.ObjectStorageClient) -> str:
    return client.get_namespace().data


def create_bucket(client: os.ObjectStorageClient, name: str):
    details = os.models.CreateBucketDetails(
        name=name,
        compartment_id=env.get("TF_VAR_compartment_id"),
        public_access_type="NoPublicAccess",
        storage_tier="Standard",
        versioning="Disabled",
    )
    return client.create_bucket(
        namespace_name=get_namespace(client),
        create_bucket_details=details
    )

def is_bucket_exists(client: os.ObjectStorageClient, name: str) -> bool:
    try:
        client.get_bucket(
            namespace_name=get_namespace(client),
            bucket_name=name
        )
        return True
    except oci_exceptions.ServiceError:
        return False

def main():
    client = get_object_storage_client()
    bucket_name = env.get("TF_VAR_backend_bucket")
    if is_bucket_exists(client, bucket_name):
        print(f"Bucket already exists: {bucket_name}")
        return
    response = create_bucket(client, bucket_name)
    print(f"Bucket created: {response.data.name}")

if __name__ == "__main__":
    main()
