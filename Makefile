bash:
	docker compose run --rm oci
.PHONY: bash

terraform:
	docker compose run --workdir=/app/terraform --rm oci 
.PHONY: terraform

serverless:
	docker compose run --workdir=/app/serverless --rm oci 
.PHONY: serverless

build:
	docker compose build
.PHONY: build

