# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20130224
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
md5sums=('887d868e544330ef850334961685cab3')

build() {
	cd $srcdir
	if [[ -d core ]]; then
		cd core && git pull origin
	else
		git clone $url --depth=1
	fi
	cd $srcdir/core/adb
	mv ../../adbMakefile makefile
	make
}

package(){
	install -D ${srcdir}/core/adb/adb ${pkgdir}/usr/bin/adb
}
