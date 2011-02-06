#
# Makefile for the synaptics mousedriver
# Don't use this when you have any other kind of serial/ps/2-mouse (usb-mouses are no problem obviously ;)
#
obj-m := psmouse.o
psmouse-objs := psmouse-base.o synaptics.o

all:
		make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
