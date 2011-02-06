KERN_VER=$(shell uname -r)
KERNELDIR=/usr/src/linux-$(KERN_VER)
PWD := $(shell pwd)

NAME=secbulk

INSTALLDIR = $(PWD)
#INSTALLDIR = /lib/modules/$(KERN_VER)/kernel/drivers/usb/misc/
CROSS_COMPILE = 
CC = $(CROSS_COMPILE)gcc
obj-m := $(NAME).o
$(NAME)-m := $(NAME).o
#obj-m := secbulk.o

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	cp $(NAME).ko $(INSTALLDIR)
clean:
	-rm -rf .*.cmd *.o *.mod.c *.ko .tmp_versions Module.symvers .Makefile.swp *.order *.markers
test:
	-sudo rmmod $(NAME)
	-sudo insmod $(NAME).ko
load:
	-sudo insmod $(NAME).ko
unload:
	-sudo rmmod $(NAME)
showmsg:
	-@sudo dmesg
.PHONY: modules modules_install clean test load unload
