SHELL := bash

.PHONY: \
	brew-install \
	brew-bundle \
	fzf \
	install-python2-dependencies \
	install-python3-dependencies \
	install-npm-dependencies \
	nvim \
	sdkman \
	zsh

all: \
	brew-install \
	brew-bundle \
	fzf \
	install-python2-dependencies \
	install-python3-dependencies \
	install-npm-dependencies \
	nvim \
	sdkman \
	zsh

brew-install:
	if [[ ! -d /usr/local/Homebrew ]]; then curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby; fi

brew-bundle:
	brew bundle

fzf:
	ln -sf $(PWD)/fzf.zsh ~/.fzf.zsh

install-python%-dependencies:
	pip$* install -r python$*-requirements.txt

install-npm-dependencies:
	npm install -g

nvim:
	if [[ ! -d ~/.config/nvim ]]; then mkdir -p ~/.config && ln -sf $(PWD)/nvim ~/.config/nvim; fi

sdkman:
	if [[ ! -d ~/.sdkman ]]; then curl -s "https://get.sdkman.io" | bash; fi

zsh:
	test -s ${HOME}/.zplug \
		|| curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh \
		| zsh
	ln -fns ${PWD}/zshrc ${HOME}/.zshrc
	ln -fns ${PWD}/zshenv ${HOME}/.zshenv
