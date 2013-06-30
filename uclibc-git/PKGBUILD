# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=uclibc-git
pkgver=0.9.32.rc3.974.gc2c684f
pkgrel=1
pkgdesc='C library for developing embedded Linux systems'
arch=('i686' 'x86_64')
url="http://www.uclibc.org/"
license=('LGPL')
makedepends=('git')
conflicts=('uclibc')
source=("git://git.busybox.net/uClibc")
md5sums=('SKIP')

pkgver() {
	cd uClibc
	git describe | sed 's/-/./g;s/v//'
}

build() {
	cd uClibc
	msg "Running make menuconfig"
	make menuconfig
	make
}

package() {
	make PREFIX="$pkgdir/" -C uClibc install
}

