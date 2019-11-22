PKG_NAME = open-vm-tools
PKG_VERS = 11.0.0
PKG_BUILD = 14549434
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS)-$(PKG_BUILD).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/vmware/open-vm-tools/releases/download/stable-$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)-$(PKG_BUILD)

# DEPENDS = cross/libmspack cross/glib cross/openssl cross/libdnet cross/fuse cross/libtirpc cross/procps-ng cross/icu
DEPENDS = 

HOMEPAGE = https://github.com/vmware/open-vm-tools
COMMENT  = VMware open-vm-tools project
LICENSE  = GPLv2/LGPLv2.1

PRE_CONFIGURE_TARGET = vmtools_pre_configure
INSTALL_TARGET = vmtools_install
# POST_INSTALL_TARGET = vmtools_post_install

# ENV += CUSTOM_PROCPS_NAME=procps
# ENV += CUSTOM_PROCPS_LIBS="-L$(STAGING_INSTALL_PREFIX)/lib -lprocps"
# ENV += PATH=$(STAGING_INSTALL_PREFIX)/bin:$$PATH

GNU_CONFIGURE = 1
CONFIGURE_ARGS = 
# CONFIGURE_ARGS = --without-x
# CONFIGURE_ARGS += --disable-resolutionkms
# CONFIGURE_ARGS += --with-tirpc
# CONFIGURE_ARGS += --without-pam
# CONFIGURE_ARGS += --without-xmlsec1

include ../../mk/spksrc.cross-cc.mk

.PHONY: vmtools_pre_configure
vmtools_pre_configure:
	$(RUN) autoreconf -fiv

.PHONY: vmtools_install
vmtools_install:
	$(RUN) $(MAKE) install DESTDIR=$(STAGING_INSTALL_PREFIX) prefix=""

# .PHONY: vmtools_post_install
# vmtools_post_install:
# 	chmod a-x $(STAGING_INSTALL_PREFIX)/etc/vmware-tools/*.conf
# 	chmod a-x $(STAGING_INSTALL_PREFIX)/lib/udev/rules.d/99-vmware-scsi-udev.rules
# 	mv $(STAGING_INSTALL_PREFIX)/etc/vmware-tools/vm-support $(STAGING_INSTALL_PREFIX)/bin/
