# Connectivity info for Linux VM

NIXADDR ?= 10.211.55.10
NIXPORT ?= 22
NIXUSER ?= brockm

# Settings
NIXBLOCKDEVICE ?= sda

# Name of the nixosConfiguration in the flake
NIXNAME ?= nixos

# SSH options
SSH_OPTIONS ?=-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

vm/bootstrap0:
	# Need to implement

vm/bootstrap:
	NIXUSER=root make vm/copy
	NIXUSER=root make vm/switch
	make vm/secrets
	ssh $(SSH_OPTIONS) -p$(NIXPORT) $(NIXUSER)@$(NIXADDR) " \
		sudo reboot; \
	"

vm/secrets:
	#SSH keys
	rsync -av -e 'ssh $(SSH_OPTIONS)' \
		--exclude='environment' \
		$(HOME)/.ssh/ $(NIXUSER)@$(NIXADDR):~/.ssh

vm/switch:
	ssh $(SSH_OPTIONS) -p$(NIXPORT) $(NIXUSER)@$(NIXADDR) " \
		sudo nixos-rebuild switch
	"
