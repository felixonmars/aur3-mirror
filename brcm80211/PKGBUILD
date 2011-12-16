# Contributor: virtuemood <virtue@archlinux.us>
pkgname=brcm80211
pkgver=20101217
pkgrel=1
license=GPL
pkgdesc="Broadcom's opensource driver"
arch=('i686' 'x86_64')
url=http://www.kernel.org
depends=('linux-firmware>=20100911' 'kernel26<2.6.37')
source_name=a3d7064

# http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git

build() {

	cd $startdir/src/linux-next-${source_name}

	echo "KDIR    := /lib/modules/`uname -r`/build" >> ./Makefile
	echo 'ccflags-y += -I$(SUBDIRS)/include -I$(SUBDIRS)/sys -I$(SUBDIRS)/phy' >> ./Makefile
	
	make -C /lib/modules/`uname -r`/build SUBDIRS=$PWD CONFIG_BRCM80211_PCI=y V=1 modules	

	mkdir -p $startdir/pkg/lib/modules/`uname -r`/
	cp $startdir/src/linux-next-${source_name}/brcm80211.ko  $startdir/pkg/lib/modules/`uname -r`/

}
