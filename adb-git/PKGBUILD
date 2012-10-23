# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20121023
pkgrel=2
pkgdesc="adb(Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('gcc' 'git' 'make')
provides=('adb')
conflicts=('adb')
url="https://android.googlesource.com/platform/system/core"
license=('Apache')
source=('Makefile')
md5sums=('cea96a4801eb1d22c3bac52654d5eebb')

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
