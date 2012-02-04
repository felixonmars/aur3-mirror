export KMODDIR?=       updates/
KMODDIR_ARG:=   "INSTALL_MOD_DIR=$(KMODDIR)"
ifneq ($(origin $(KLIB)), undefined)
KMODPATH_ARG:=  "INSTALL_MOD_PATH=$(KLIB)"
else
export KLIB:=          /lib/modules/$(shell uname -r)
endif
export KLIB_BUILD ?=    $(KLIB)/build
export FW_PATH ?=    /lib/firmware/
export PWD := $(shell pwd)

# Sometimes not available in the path
MODPROBE := /sbin/modprobe

obj-m += ath3k.o

modules:
	$(MAKE) -C $(KLIB_BUILD) M=$(PWD) modules
install: modules
	$(MAKE) -C $(KLIB_BUILD) M=$(PWD) $(KMODDIR_ARG) $(KMODPATH_ARG) \
		modules_install
	@scripts/compress_modules
	@scripts/check_depmod
	@install ath3k-1.fw $(FW_PATH)
	@depmod -a
	@echo
	@echo "ath3k module should now be recognized by the kernel:"
	@echo 
	@$(MODPROBE) -l ath3k

clean:
	$(MAKE) -C $(KLIB_BUILD) M=$(PWD) clean
all: modules

clean-files := Module.symvers modules.order Module.markers modules.order
