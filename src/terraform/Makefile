.DEFAULT_GOAL := help
ifeq ($(MODULE),)
MODULE = base
endif

CMD = tofu
ifeq ($(shell which tofu),"")
CMD = terraform
endif

init:
	cd $(MODULE) && $(CMD) init $(ARGS) \
		-backend-config="bucket=$(TF_BACKEND_BUCKET)" \
		-backend-config="key=$(MODULE)/terraform.tfstate" \
		-backend-config="region=$(OCI_REGION)" \
		-backend-config="endpoint=https://$(TF_VAR_os_namespace).compat.objectstorage.$(OCI_REGION).oraclecloud.com" \
		-backend-config="skip_region_validation=true" \
		-backend-config="skip_credentials_validation=true" \
		-backend-config="skip_requesting_account_id=true" \
		-backend-config="skip_metadata_api_check=true" \
		-reconfigure
.PHONY: init

plan:
	cd $(MODULE) && tofu plan $(ARGS)
.PHONY: plan

apply:
	cd $(MODULE) && tofu apply $(ARGS)
.PHONY: apply

destroy:
	cd $(MODULE) && tofu destroy $(ARGS)
.PHONY: destroy

new:
	if [ -d $(MODULE) ]; then echo "モジュールがすでに存在します"; exit 1; fi
	mkdir $(MODULE) && cp base/main.tf $(MODULE)/main.tf
.PHONY: new

help:
	@echo "Usage: make [MODULE=<module>] [ARGS=<args>] Target"
	@echo "Target:"
	@echo "  init: モジュールを初期化します"
	@echo "  plan: 適用内容を確認します"
	@echo "  apply: 変更を適用します"
	@echo "  destroy: リソースを破棄します"
	@echo "  new: 新しいモジュールを作成します"
	@echo "  help: このヘルプを表示します"
	@echo "MODULE: モジュール名を指定します。デフォルトはbaseです。"
	@echo "ARGS: terraform/tofuコマンドに渡す引数を指定します。"
	@echo "コマンド例:"
	@echo "  - 新しいモジュールを作成します:"
	@echo "    make new MODULE=object-storage"
	@echo "  - バックエンド設定ファイルを指定して初期化します:"
	@echo "    make init MODULE=base ARGS=-backend-config=backend.tfvars"
	@echo "  - 変数ファイルを指定して適用内容を確認します:"
	@echo "   make plan MODULE=base ARGS=-var-file=variables.tfvars"
	@echo "  - 変更を自動承認して適用します:"
	@echo "   make apply MODULE=base ARGS=-auto-approve"
	@echo "  - 特定のリソースを強制的に破棄します:"
	@echo "   make destroy MODULE=object-storage ARGS=-force -target=oci_objectstorage_bucket.sample"
.PHONY: help

