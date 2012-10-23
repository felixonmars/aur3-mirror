# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20121023
pkgrel=3
pkgdesc="adb(Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('gcc' 'git' 'make')
provides=('adb')
conflicts=('adb')
url="https://android.googlesource.com/platform/system/core"
license=('Apache')
source=('adbMakefile')
md5sums=('20f0818b9985f70ee061df161ecdb656')

build() {
	cd $srcdir
	git clone $url
	mv adbMakefile core/adb/makefile
	cd core/adb
	make
}

package(){
	install -D ${srcdir}/core/adb/adb ${pkgdir}/usr/bin/adb
}
