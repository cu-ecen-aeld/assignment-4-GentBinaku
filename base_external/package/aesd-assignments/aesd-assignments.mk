
################################################################################
# aesd-assignments Buildroot package
################################################################################
# This package will fetch your AESD assignments repository, build the aesdsocket
# daemon, and install the binary and init script into the target filesystem.
################################################################################
AESD_ASSIGNMENTS_VERSION = 584f36dcaba2c21c9049e28629b4d1d78235208f
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-GentBinaku.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

AESD_ASSIGNMENTS_DEPENDENCIES = 

# Use server subdirectory to build aesdsocket
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/server \
		CC="$(TARGET_CC)" \
		LD="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" all
endef

# Install the aesdsocket binary and init script
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install the aesdsocket executable
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket \
		$(TARGET_DIR)/usr/bin/aesdsocket

	# Install the init script under S99 to run at the proper runlevels
	$(INSTALL) -D -m 0755 $(@D)/server/aesd-start-stop \
		$(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

AESD_ASSIGNMENTS_LICENSE = MIT
AESD_ASSIGNMENTS_LICENSE_FILES = LICENSE

$(eval $(generic-package))

