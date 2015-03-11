KERNELRELEASE ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KERNELRELEASE)/build
PWD ?= $(shell pwd)

obj-m += btier.o
btier-objs :=
btier-objs += btier_common.o
btier-objs += btier_sysfs.o
btier-objs += btier_main.o 

default: modules
install: modules_install

modules modules_install clean:
	$(MAKE) -C $(KDIR) M=$(PWD) $@
