# Maintainer: Prurigro
pkgname=sixpair-bluez
pkgver=4.39
pkgrel=2
pkgdesc="Provides bluetooth pairing for the PS3 sixaxis controller over usb"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-core' 'glib2>=2.20.1' 'libusb')
makedepends=('gstreamer0.10-base' 'alsa-lib' 'libusb' 'libnl')
options=(!libtool)
source=(http://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.bz2)
md5sums=('3f7671a3939eabbc261d3a92da83445f')

build() {
	pushd "${srcdir}/bluez-${pkgver}" || return 1
		./configure || return 1
		make || return 1
		pushd input || return 1
			gcc -g -Wall -I../src -I../lib/ -I../include -DSTORAGEDIR=\"/var/lib/bluetooth\" -o sixpair sixpair.c ../src/storage.c ../common/libhelper.a -I../common `pkg-config --libs --cflags glib-2.0 libusb-1.0` -lbluetooth -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include || return 1
			install -d ${pkgdir}/usr/sbin || return 1
			install -D -m755 sixpair ${pkgdir}/usr/sbin/ || return 1
		popd || return 1
	popd || return 1
}
