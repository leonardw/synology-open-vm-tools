SPK_NAME = open-vm-tools
SPK_VERS = 10.3.10
SPK_REV = 100
SPK_ICON = src/open-vm-tools.png
BETA = 1

DEPENDS = cross/$(SPK_NAME)
# REQUIRED_DSM = 6.1

MAINTAINER = leonardw
DESCRIPTION = open-vm-tools is a set of services and modules that enable several features in VMware products for better management of, and seamless user interactions with, guests.
RELOAD_UI = yes
DISPLAY_NAME = VMware Tools
CHANGELOG = "* 2019-11-05 open-vm-tools 10.3.10 SPK rev. 100"

HOMEPAGE = https://github.com/vmware/open-vm-tools
LICENSE  = GPLv2/LGPLv2.1

# INSTALLER_SCRIPT = src/installer.sh
# SSS_SCRIPT       = src/dsm-control.sh

# INSTALL_PREFIX = /usr/local/$(SPK_NAME)

# 'auto' reserved value grabs SPK_NAME
SERVICE_USER  = auto
SERVICE_SETUP = src/service-setup.sh
CONF_DIR      = src/conf
STARTABLE     = yes

# POST_STRIP_TARGET = vmtools_extra_install

include ../../mk/spksrc.spk.mk

# .PHONY: vmtools_extra_install
# vmtools_extra_install:
# 	install -m 755 -d $(STAGING_DIR)/app
# 	install -m 755 -d $(STAGING_DIR)/app/images
# 	for size in 16 24 32 48; do \
# 		convert $(SPK_ICON) -thumbnail $${size}x$${size} \
# 			$(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
# 	done
