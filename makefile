help:
	@perl -ne '/^([A-Za-z0-9-_]+):.*#\s+(.*)/ && \
		printf "%*s%s\n", 10, $$1, $$2 ? " - $$2" : ""' makefile

start: # start test image
	vagrant up --no-provision

ssh: start # ssh to test image
	vagrant ssh

remove: # remove test image
	vagrant destroy --force

reload: # reload test image
	vagrant reload

test: start # reload test image and apply playbook
	vagrant reload --provision

remove-test: remove test # remove and test test image

apply: # apply playbook locally
	ansible-playbook install.yaml

install: # install required packages
	su root -c " \
		apt update 						 ; \
		apt install sudo python3-pip 				 ; \
		/usr/sbin/usermod -aG sudo $$USER 			 ; \
		echo '$$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 	 ; \
		pip3 install ansible"
