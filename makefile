DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) $(wildcard .config/*) bin
EXCLUSIONS := .git .config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

deploy: ## Create symlink
	@$(foreach p, $(DOTFILES), ln -svnf $(PWD)/$p $(HOME)/$p;)

install: ## Install apps
	@bash $(DOTPATH)/etc/init/init.sh

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort 											\
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
