PACKAGES := curl wget flameshot mpd ncmpcpp keepassxc \
			feh redshift thunar

# Default target
.PHONY: all
all: install

# Install packages
.PHONY: install
install:
	sudo apt-get update
	sudo apt-get install $(PACKAGES)

# https://calibre-ebook.com/download_linux
.PHONY: calibre
calibre:
	sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

.PHONY: rustup
rustup:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
