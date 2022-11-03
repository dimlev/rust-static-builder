IMAGE=dimlev/rust-static-builder
STABLE_VERSION=1.65.0
CURRENT_DATE:=$(shell date "+%Y-%m-%d")

build-stable:
	docker build --build-arg TOOLCHAIN=$(STABLE_VERSION) --tag $(IMAGE):$(STABLE_VERSION) --tag $(IMAGE):latest .

push-stable: build-stable
	docker push --all-tags $(IMAGE)

clean:
	docker rmi $(IMAGE)

.PHONY: build-stable push-stable clean
