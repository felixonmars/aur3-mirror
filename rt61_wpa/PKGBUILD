pkgname=rt61_wpa
pkgver=1.2.1
pkgrel=1
pkgdesc="Drivers Ralink RT61 + WPA_Supplicant - Bundle/Puñetero Edition"
url="http://www.ralinktech.com/ralink/Home/Support/Linux.html"
license=('GPL')
arch=('i686')
options=(docs)
conflicts=(wpa_supplicant)
provides=(wpa_supplicant)
__filename=2008_0506_RT61_Linux_STA_v1.1.2.1

build() {

## Se construye el puñetero driver primero

	mkdir $startdir/pkg/usr/share/doc/rt61 -p
	mkdir $startdir/pkg/etc/Wireless/RT61STA -p
	mkdir $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/net -p
	cd $startdir/src/`echo $__filename`/Module
	make
	cp rt61.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/net
	cp *.bin rt61sta.dat $startdir/pkg/etc/Wireless/RT61STA
	cp README iwpriv_usage.txt STA_iwpriv_ATE_usage.txt $startdir/pkg/usr/share/doc/rt61

## Ahora, se le echa mano al wpa_supplicant integrado

	mkdir $startdir/pkg/usr/sbin -p
	mkdir /tmp/tranfugo
	cd ../WPA_Supplicant
	cat defconfig |
	sed 's/CONFIG_DRIVER_HOSTAP=y/#CONFIG_DRIVER_HOSTAP=y/' | \
	sed 's/#CONFIG_DRIVER_NDISWRAPPER=y/CONFIG_DRIVER_NDISWRAPPER=y/' | \
	sed 's/#CONFIG_DRIVER_WEXT=y/CONFIG_DRIVER_WEXT=y/' > .config
	make DESTDIR=/tmp/tranfugo
	make DESTDIR=/tmp/tranfugo install
	cp /tmp/tranfugo/usr/local/sbin/* $startdir/pkg/usr/sbin
	rm /tmp/tranfugo -r
}

