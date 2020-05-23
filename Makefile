BUILD_VERSION = 0.0.1
NAME = oxydedefer-labo/ansible
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SSH_LOCATION:=$(HOME)/.ssh
ANSIBLE_VAULT_PASSWORD=?

all: build

build:
	docker build -t $(NAME):latest .

clean:
	docker stop $(NAME)
	docker rm $(NAME)

run:
	docker run --rm -ti $(NAME) ansible --version

debug:
	docker run --rm -ti -v $(ROOT_DIR):/app -v $(SSH_LOCATION):/home/.ssh $(NAME):latest bash

test_alive:
	docker run --rm -ti -v $(ROOT_DIR):/app -v $(SSH_LOCATION):/home/.ssh $(NAME):latest bash -c "echo $(ANSIBLE_VAULT_PASSWORD) > /tmp/.vault_pass; ansible-playbook --vault-password-file /tmp/.vault_pass -i inventories/TARGET playbook_hosts_alive.yml"
