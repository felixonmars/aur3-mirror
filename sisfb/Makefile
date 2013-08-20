obj-m:=sisfb.o
KDIR:=/lib/modules/$(shell uname -r)/build
PWD:=$(shell pwd)
sisfb-objs := sis_main.o sis_accel.o init.o init301.o initextlfb.o
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
