TAG := 2.2.6
TOOLS_IMAGE := ministryofjustice/cloud-platform-tools

tools-shell:
	docker pull --platform=linux/amd64 $(TOOLS_IMAGE):$(TAG)
	docker run --platform=linux/amd64 --rm -it \
    -e AWS_PROFILE=$${AWS_PROFILE} \
		-v $$(pwd):/app \
		-v $${HOME}/.aws:/root/.aws \
		-v $${HOME}/.docker:/root/.docker \
		-w /app \
		$(TOOLS_IMAGE):$(TAG) bash

