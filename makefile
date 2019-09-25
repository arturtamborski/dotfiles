help: # print this help
	@perl -ne '/^([A-Za-z0-9-_]+):.*#\s+(.*)/ && \
		printf "%*s%s\n", 9, $$1, $$2 ? " - $$2" : ""' makefile


ssh: start # enter test image
	vagrant ssh


start: # start test image
	vagrant up --no-provision


stop: # stop test image
	vagrant halt


remove: # remove test image
	vagrant destroy --force


reload: # reload test image
	vagrant reload


test: start # apply playbook in test image
	vagrant reload --provision


apply: # apply playbook locally (with optional role=<role>)
	@test -z "${role}" \
		&& ansible-playbook install.yaml \
		|| ansible-playbook install.yaml -t ${role}


bootstrap: # install required packages, add user to sudoers
	su root -c "                                               \
		apt  update                                          ; \
		apt  install --yes          sudo python3-pip         ; \
		pip3 install --no-cache-dir ansible==2.8.3           ; \
		/usr/sbin/usermod -aG sudo $$USER                    ; \
		echo '$$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers ; \
		echo "Done, run `make apply` to install dotfiles"
