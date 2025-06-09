################################################################################
# ldd Buildroot package
################################################################################
# This package will fetch your LDD assignments repository, build the ldd module
# and install the binary and init script into the target filesystem.
################################################################################
LDD_VERSION = dacac60e4a7ec929fffb05f0302203956c29764e
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-GentBinaku
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)


define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
endef
LDD_POST_BUILD_HOOKS += LDD_INSTALL_TARGET_CMDS

$(eval $(kernel-module))
$(eval $(generic-package))
