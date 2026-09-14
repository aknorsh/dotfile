ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
COMMON := zsh

.PHONY: install check

install:
	cd $(ROOT) && git submodule update --init --recursive
	cd $(ROOT) && stow -R -v $(COMMON)
	@touch $(HOME)/.zshrc

check:
	cd $(ROOT) && stow -R -n -v $(COMMON)
