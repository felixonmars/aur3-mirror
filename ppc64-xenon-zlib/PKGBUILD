# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-zlib
pkgver=1.2.5
pkgrel=1
pkgdesc="A Massively Spiffy Yet Delicately Unobtrusive Compression Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'ppc64-xenon-newlib' 'ppc64-xenon-gcc-elf')
provides=('ppc64-xenon-zlib')
url="http://free60.org"
options=(!strip !buildflags)
source=(http://zlib.net/zlib-1.2.5.tar.gz
        Makefile.patch)

md5sums=('c735eab2d659a96e5a594c9e8541ad63'
         '8fb54a0fe2179278322ea6707c553fb2')

build() {
	cd ${srcdir}/zlib-${pkgver}
	export DEVKITXENON=/usr/xenon
	export CC=xenon-gcc
	export CFLAGS="-mcpu=cell -mtune=cell -m32 -fno-pic -mpowerpc64 $DEVKITXENON/lib/libxenon.a -L$DEVKITXENON/lib/32/ -T$DEVKITXENON/app.lds -u read -u _start -u exc_base"
	export LDFLAGS=""
	patch < ../Makefile.patch
	./configure --prefix=/usr/xenon
	make CROSS_COMPILE=xenon-
}

package() {
	cd ${srcdir}/zlib-${pkgver}
	make CROSS_COMPILE=xenon- DESTDIR=${pkgdir} install
	rm ${pkgdir}/usr/xenon/share -r
}
