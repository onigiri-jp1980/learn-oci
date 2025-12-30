bash:
	docker compose run --rm oci
.PHONY: bash

terraform:
	docker compose run --workdir=/app/terraform --rm oci 
.PHONY: terraform

build:
	docker compose build
.PHONY: build

