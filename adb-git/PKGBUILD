# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20121119
pkgrel=1
pkgdesc="adb(Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
depends=('libusb')
makedepends=('gcc' 'git' 'make')
provides=('adb')
conflicts=('adb')
url="http://android.googlesource.com/platform/system/core"
license=('Apache')
source=('adbMakefile')
md5sums=('11479c2535f9ba0ef00d9ea0d9e9d694')

build() {
	cd $srcdir
	git clone $url -b tools_r21 --depth=1
	mv adbMakefile core/adb/makefile
	cd core/adb
	make
}

package(){
	install -D ${srcdir}/core/adb/adb ${pkgdir}/usr/bin/adb
}
