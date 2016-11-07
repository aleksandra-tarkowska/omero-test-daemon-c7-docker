NS = openmicroscopy
VERSION ?= local

REPO = omero-test-daemon-c7
NAME = omero-test-daemon-c7

build:
	docker build $(BUILDARGS) -t $(NS)/$(REPO):$(VERSION) .

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(LINKS) $(ENV) $(NS)/$(REPO):$(VERSION) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(LINKS) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(LINKS) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)

rm:
	docker rm $(NAME)

default: build

.PHONY: build push shell run start stop rm release