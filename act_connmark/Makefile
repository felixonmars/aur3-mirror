obj-m:=act_connmark.o

KDIR:=/lib/modules/$(shell uname -r)/build

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
