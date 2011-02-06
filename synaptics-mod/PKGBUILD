# Contributor: Pieter Kelchtermans <pieter.kelchtermans@gmail.com>
pkgname=synaptics-mod
pkgver=1
pkgrel=2
pkgdesc="Kernel module for synaptics touchpads that ignores misinterpretable coordinates"
arch=(i686 x86_64)
url="http://www.kernel.org"
license=('GPL')
depends=('kernel26>=2.6.27')
install=${pkgname}.install
source=(psmouse-base.c
		psmouse.h
		synaptics.c
		synaptics.h
		Makefile
		coordinates.patch
		)
md5sums=('')

_kernver=2.6.27-ARCH

build() {
		cd $startdir/src/
		patch < coordinates.patch || return 1
		make || return 1
		install -D psmouse.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/input/mouse/psmouse.ko.new || return 1
}

