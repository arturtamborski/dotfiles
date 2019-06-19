clean:
	vagrant destroy --force

reload:
	vagrant reload

test:
	vagrant reload --provision

hard-test: clean test

install:
	ansible-playbook -i install.yaml
