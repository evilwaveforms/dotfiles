PACKAGES := curl wget flameshot mpd ncmpcpp keepassxc \
			feh redshift thunar i3 i3blocks tmux git \
			ninja-build gettext cmake unzip build-essential \
			ccache apt-listbugs ripgrep libx11-dev xclip \
			libxft-dev mpv arandr mpc redshift python3-pynvim

# Default target
.PHONY: all
all: help

help: ## prints help for targets with comments
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Packages to be installed by the 'install' target:"
	@echo "$(PACKAGES)" | xargs -n 20 | awk '{printf " %s\n", $$0}'

.PHONY: sshkey
sshkey: ## create a new ssh key
	read -p "Enter filename for the SSH key: " filename && \
	read -p "Enter label for the SSH key: " label && \
	ssh-keygen -t ed25519 -f ~/.ssh/$$filename -C "$$label" && \
	eval "$(ssh-agent -s)" && \
	ssh-add ~/.ssh/$$filename && \
	cat ~/.ssh/$$filename.pub | xclip -selection clipboard

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

.PHONY: fzf
fzf: ## clone and build fzf
	@if [ -d "$(HOME)/.fzf" ]; then \
		cd $(HOME)/.fzf && git pull; \
	else \
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
	fi
	~/.fzf/install
