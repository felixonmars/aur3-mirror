# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-libpng
pkgver=1.5.4
pkgrel=1
pkgdesc="libpng is the official PNG reference library. It supports almost all PNG features, is extensible, and has been extensively tested for over 15 years."
arch=('i686' 'x86_64')
license=('libpng')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'ppc64-xenon-newlib' 'ppc64-xenon-gcc-elf')
provides=('ppc64-xenon-libpng')
url=("http://www.libpng.org")
options=(!strip !buildflags)
source=(ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-${pkgver}.tar.xz)
md5sums=('5f4e7ca1b54f361c5cfe5d520d989f29')

build() {
	cd ${srcdir}/libpng-${pkgver}
	export DEVKITXENON=/usr/xenon
	export CC=xenon-gcc
	export CFLAGS="-mcpu=cell -mtune=cell -m32 -fno-pic -mpowerpc64 $DEVKITXENON/lib/libxenon.a -L$DEVKITXENON/lib/32/ -T$DEVKITXENON/app.lds -u read -u _start -u exc_base"
	export LDFLAGS=""
	./configure --prefix=/usr/xenon --host=$CHOST
	make CROSS_COMPILE=xenon-
}

package() {
	cd ${srcdir}/libpng-${pkgver}
	make CROSS_COMPILE=xenon- DESTDIR=${pkgdir} install
	rm ${pkgdir}/usr/xenon/share -r
}
