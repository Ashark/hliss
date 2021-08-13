help:                ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: install-fakecamera
install-fakecamera:  ## install fakecamera to ~/bin
	mkdir -p ~/bin
	ln -s "${PWD}/fakecamera" ~/bin
	mkdir -p ~/.config/systemd/user
	ln -s "${PWD}/fakecamera@.service" ~/.config/systemd/user
	systemctl --user daemon-reload
