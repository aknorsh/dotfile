ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
COMMON := zsh

# コマンド名:brew パッケージ名
REQUIRED_CMDS := stow:stow nvim:neovim

.PHONY: install check check-deps

check-deps:
	@missing=""; \
	for entry in $(REQUIRED_CMDS); do \
		command -v $${entry%%:*} >/dev/null 2>&1 || missing="$$missing $${entry##*:}"; \
	done; \
	if [ -n "$$missing" ]; then \
		echo "必要なパッケージが見つかりません:$$missing" >&2; \
		echo "インストールしてください: brew install$$missing" >&2; \
		exit 1; \
	fi

install: check-deps
	cd $(ROOT) && git submodule update --init --recursive
	cd $(ROOT) && stow -R -v $(COMMON)
	@touch $(HOME)/.zshrc

check: check-deps
	cd $(ROOT) && stow -R -n -v $(COMMON)
