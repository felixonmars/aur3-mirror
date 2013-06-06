# Contributor: Cody Mize <me@codymize.com>
pkgname=dm2linux
pkgver=1.0.1
pkgrel=1
pkgdesc="A Linux Alsa MIDI device driver for the Mixman dm2(TM) virtual turntable device."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dm2linux/"
license=('GPL')
depends=('linux>=3.8.0')
makedepends=('gcc' 'git' 'linux-headers>=3.8.0')
source=(git://github.com/kingcody/dm2linux.git#branch=master)
install=${pkgname}.install
_kernver=`uname -r`
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --always | sed 's|-|.|g'
}

build() {
	cd $pkgname
	make
}

package() {
	idir=${pkgdir}/lib/modules/${_kernver}/kernel/sound/drivers
	cd dm2linux
	mkdir -p $idir
	install -Dm644 dm2.ko $idir
}
