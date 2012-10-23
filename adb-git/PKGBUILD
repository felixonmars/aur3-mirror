# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20121023
pkgrel=1
pkgdesc="Open source version of adb"
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('gcc' 'git' 'make')
provides=('adb')
conflicts=('adb')
url="https://android.googlesource.com/platform/system/core"
license=('Apache')
source=('Makefile')
md5sums=('d6d7a0082cc5687074f479d7d96b68d4')

build() {
	cd $srcdir
	git clone $url
	mv Makefile core
	cd core
	make
}

package(){
	cd ${srcdir}/core
	make DESTDIR=${pkgdir} install
}
