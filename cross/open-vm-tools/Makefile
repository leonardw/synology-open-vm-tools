PKG_NAME = open-vm-tools
PKG_VERS = 10.3.10
PKG_BUILD = 12406962
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS)-$(PKG_BUILD).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/vmware/open-vm-tools/releases/download/stable-$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)-$(PKG_BUILD)

DEPENDS = cross/libmspack cross/glib cross/openssl cross/libdnet cross/fuse cross/libtirpc cross/procps-ng

HOMEPAGE = https://github.com/vmware/open-vm-tools
COMMENT  = VMware open-vm-tools project
LICENSE  = GPLv2/LGPLv2.1

PRE_CONFIGURE_TARGET = vmtools_pre_configure
INSTALL_TARGET = vmtools_install

ENV += CUSTOM_PROCPS_NAME=procps
ENV += CUSTOM_PROCPS_LIBS="-L$(STAGING_INSTALL_PREFIX)/lib -lprocps"
ENV += PATH=$(STAGING_INSTALL_PREFIX)/bin:$$PATH
# ADDITIONAL_CFLAGS = -Wno-error -Dlinux=1 -Wno-implicit-function-declaration
# ADDITIONAL_LDFLAGS = -L$(STAGING_INSTALL_PREFIX)/lib64 -Wl,--rpath-link,$(STAGING_INSTALL_PREFIX)/lib64 -Wl,--rpath,$(INSTALL_PREFIX)/lib64
# ADDITIONAL_CXXFLAGS = -std=c++11

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --without-x
CONFIGURE_ARGS += --disable-resolutionkms
CONFIGURE_ARGS += --with-tirpc
CONFIGURE_ARGS += --without-pam
CONFIGURE_ARGS += --without-xmlsec1
# CONFIGURE_ARGS += --without-xmlsecurity
# CONFIGURE_ARGS += --without-xerces
CONFIGURE_ARGS += --without-icu

# CONFIGURE_ARGS += --without-root-privileges
#redundant CONFIGURE_ARGS += --with-dnet
#redundant CONFIGURE_ARGS += --enable-deploypkg
#redundant CONFIGURE_ARGS += --without-kernel-modules

include ../../mk/spksrc.cross-cc.mk

.PHONY: vmtools_pre_configure
vmtools_pre_configure:
	$(RUN) autoreconf -fiv

.PHONY: vmtools_install
vmtools_install:
	$(RUN) $(MAKE) install DESTDIR=$(STAGING_INSTALL_PREFIX) prefix=""
