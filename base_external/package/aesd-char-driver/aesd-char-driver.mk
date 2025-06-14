#######################################################################
#			AESD_CHAR_DRIVER.mk
#####################################################################


AESD_CHAR_DRIVER_VERSION = e678bc4da3039f17b7a4eef05cfa373977267c43
AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-GentBinaku.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES


# This Variable tells Build root which subdirectories to descend int

AESD_CHAR_DRIVER_MODULE_SUBDIRS += aesd-char-driver

AESD_CHAR_DRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8/* $(TARGET_DIR)/usr/bin
		
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	for ko in $(@D)/aesd-char-driver/*.ko; do \
		$(INSTALL) -m 0755 $$ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/; \
	done
	
	# Regenerate module dependency list
	#$(HOST_DIR)/usr/sbin/depmod -a $(LINUX_VERSION_PROBED) 
endef


# The following is an example of how Buildroot's kmod mechanismm mightbe used if your modules are 
# built using a common Makefile pattern
	
$(eval $(generic-package))
$(eval $(kernel-module))
