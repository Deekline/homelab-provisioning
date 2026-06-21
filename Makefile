.PHONY: init plan apply destroy

AGE_KEY := $(HOME)/.config/sops/age/keys.txt

init:
	@if [ -f $(AGE_KEY) ]; then \
		echo "age key already present at $(AGE_KEY), skipping"; \
	else \
		mkdir -p $(dir $(AGE_KEY)); \
		op document get sops-age-key --vault="Personal" > $(AGE_KEY); \
		chmod 600 $(AGE_KEY); \
		echo "age key written to $(AGE_KEY)"; \
	fi
	terraform -chdir=terraform init

plan:
	@test -n "$(NODE)" || (echo "usage: make plan NODE=node1" && exit 1)
	@sops -d terraform/secrets.tfvars > /tmp/secrets.tfvars
	@trap 'rm -f /tmp/secrets.tfvars' EXIT; \
	terraform -chdir=terraform plan -var-file=/tmp/secrets.tfvars -var-file=$(NODE).tfvars

apply:
	@test -n "$(NODE)" || (echo "usage: make apply NODE=node1" && exit 1)
	@sops -d terraform/secrets.tfvars > /tmp/secrets.tfvars
	@trap 'rm -f /tmp/secrets.tfvars' EXIT; \
	terraform -chdir=terraform apply -var-file=/tmp/secrets.tfvars -var-file=$(NODE).tfvars

destroy:
	@test -n "$(NODE)" || (echo "usage: make destroy NODE=node1" && exit 1)
	@sops -d terraform/secrets.tfvars > /tmp/secrets.tfvars
	@trap 'rm -f /tmp/secrets.tfvars' EXIT; \
	terraform -chdir=terraform destroy -var-file=/tmp/secrets.tfvars -var-file=$(NODE).tfvars
