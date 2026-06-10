.PHONY: install uninstall help

# Package information from typst.toml
PACKAGE_NAME = fontys-ftenl-thesis-template
PACKAGE_VERSION = 0.1.1
NAMESPACE = local

# Detect OS and set data directory
UNAME := $(shell uname -s)
ifeq ($(UNAME),Linux)
	DATA_DIR := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)
else ifeq ($(UNAME),Darwin)
	DATA_DIR := $(HOME)/Library/Application Support
else ifeq ($(OS),Windows_NT)
	DATA_DIR := $(APPDATA)
else
	$(error Unsupported operating system)
endif

# Target directory for the package
INSTALL_DIR := $(DATA_DIR)/typst/packages/$(NAMESPACE)/$(PACKAGE_NAME)/$(PACKAGE_VERSION)

# Current directory (absolute path)
CURRENT_DIR := $(shell pwd)

help:
	@echo "Available targets:"
	@echo "  install    - Create symlink to install package locally"
	@echo "  uninstall  - Remove the installed package symlink"
	@echo ""
	@echo "Package will be installed to:"
	@echo "  $(INSTALL_DIR)"

install:
	@echo "Installing $(PACKAGE_NAME):$(PACKAGE_VERSION) to $(NAMESPACE) namespace..."
	@mkdir -p "$(DATA_DIR)/typst/packages/$(NAMESPACE)/$(PACKAGE_NAME)"
	@if [ -L "$(INSTALL_DIR)" ]; then \
		echo "Removing existing symlink..."; \
		rm "$(INSTALL_DIR)"; \
	elif [ -d "$(INSTALL_DIR)" ]; then \
		echo "Error: $(INSTALL_DIR) exists and is not a symlink"; \
		echo "Please remove it manually first"; \
		exit 1; \
	fi
	@ln -sf "$(CURRENT_DIR)" "$(INSTALL_DIR)"
	@echo "✓ Package installed successfully!"
	@echo "You can now use it with: #import \"@$(NAMESPACE)/$(PACKAGE_NAME):$(PACKAGE_VERSION)\""

uninstall:
	@if [ -L "$(INSTALL_DIR)" ]; then \
		echo "Removing package symlink..."; \
		rm "$(INSTALL_DIR)"; \
		echo "✓ Package uninstalled successfully!"; \
	elif [ -d "$(INSTALL_DIR)" ]; then \
		echo "Error: $(INSTALL_DIR) exists but is not a symlink"; \
		echo "Please remove it manually"; \
		exit 1; \
	else \
		echo "Package is not installed"; \
	fi
