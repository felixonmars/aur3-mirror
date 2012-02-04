# Contributor: virtuemood <virtue@archlinux.us>

pkgname=firmware-brcm80211-git
pkgver=20110612
pkgrel=1
license=GPL
pkgdesc="firmware of Broadcom's opensource driver"
arch=('i686' 'x86_64')
url=http://www.kernel.org
source=()

build() {
	cd $startdir/src/
	wget 'http://git.kernel.org/?p=linux/kernel/git/dwmw2/linux-firmware.git;a=snapshot;h=e62f89cefb4660a16b192c57b446cac975836d05;sf=tgz' -O firmware.tgz
	tar xzf ./firmware.tgz
	firmware_name=`ls|grep linux-firmware|sed 's/linux-firmware-//g'`

	mkdir -p $startdir/pkg/lib/firmware/brcm/
 	cp $startdir/src/linux-firmware-${firmware_name}/*  $startdir/pkg/lib/firmware/brcm/
}
