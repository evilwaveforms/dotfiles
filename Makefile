PACKAGES := curl wget flameshot mpd ncmpcpp keepassxc \
			feh redshift thunar i3 i3blocks tmux git \
			ninja-build gettext cmake unzip build-essential \
			ccache apt-listbugs ripgrep libx11-dev

# Default target
.PHONY: all
all: help

help: ## prints help for targets with comments
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Packages to be installed by the 'install' target:"
	@echo "$(PACKAGES)" | xargs -n 20 | awk '{printf " %s\n", $$0}'


.PHONY: install
install: ## install packages
	sudo apt-get update
	sudo apt-get install $(PACKAGES)

.PHONY: calibre
calibre: ## download and install calibre; https://calibre-ebook.com/download_linux
	sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

.PHONY: rustup
rustup: ## download and install rustup; https://sh.rustup.rs 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

.PHONY: neovim
neovim: ## clone and build neovim
	@if [ -d "$(HOME)/neovim" ]; then \
		cd $(HOME)/neovim && git pull && make distclean; \
	else \
		cd $(HOME) && git clone https://github.com/neovim/neovim; \
	fi
	cd $(HOME)/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install

.PHONY: st
st: ## clone and build st
	@if [ -d "$(HOME)/st" ]; then \
		cd $(HOME)/st && git pull; \
	else \
		cd $(HOME) && git clone git@github.com:evilwaveforms/st.git; \
	fi
	cd $(HOME)/st && sudo make clean install
