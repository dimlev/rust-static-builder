IMAGE=dimlev/rust-static-builder
STABLE_VERSION=1.67.0
CURRENT_DATE:=$(shell date "+%Y-%m-%d")

build-stable:
	docker build --build-arg TOOLCHAIN=$(STABLE_VERSION) --tag $(IMAGE):$(STABLE_VERSION) --tag $(IMAGE):latest .

push-stable: build-stable
	docker push $(IMAGE):$(STABLE_VERSION)

push-latest: build-stable
	docker push $(IMAGE):latest

clean:
	docker rmi $(IMAGE)

.PHONY: build-stable push-stable clean

