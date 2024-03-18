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
