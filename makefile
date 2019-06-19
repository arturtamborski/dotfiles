help:
	@perl -ne '/^([A-Za-z0-9-_]+):.*#\s+(.*)/ && \
		printf "%*s%s\n", 10, $$1, $$2 ? " - $$2" : ""' makefile

up: # start test image
	vagrant up --no-provision

ssh: up # ssh to test image
	vagrant ssh

clean: # remove test image
	vagrant destroy --force

reload: # reload test image
	vagrant reload

test: up # reload test image and apply playbook
	vagrant reload --provision

clean-test: clean test # recreeate and provision test image

install: # apply playbook locally
	ansible-playbook -i install.yaml
