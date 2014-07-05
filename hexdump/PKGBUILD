# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=hexdump
pkgver=2.25
_pkgsubver='-rc2'
pkgrel=2
pkgdesc="Latest hexdump from util-linux (newer than Core repo), but without the other utils. Does not conflict with util-linux."
arch=('i686' 'x86_64')
url="http://www.kernel.org/pub/linux/utils/util-linux/"
license=('GPL2')
source=(https://www.kernel.org/pub/linux/utils/util-linux/v${pkgver}/util-linux-${pkgver}${_pkgsubver}.tar.xz)
md5sums=('9df5663b5b302a5219c2b7ba38868071')

build() {
	cd "$srcdir/util-linux-${pkgver}${_pkgsubver}"
	./autogen.sh
	./configure --disable-all-programs --disable-nls --without-python
	sed -i '/INVOCATION_SHORT/d' config.h
	sed -i 's/#define UTIL_LINUX_C_H/&\n#include "..\/config.h"/' include/c.h
	gcc ${CFLAGS} ${LDFLAGS} text-utils/hexdump*.c lib/{colors,strutils}.c -Iinclude -o hexdump-${pkgver}
	strip --strip-all hexdump-${pkgver}
	gzip -9qc text-utils/hexdump.1 >hexdump-${pkgver}.1.gz
}

package() {
	cd "$srcdir/util-linux-${pkgver}${_pkgsubver}"
	install -Dm755 hexdump-${pkgver}       $pkgdir/usr/bin/hexdump-${pkgver}
	install -Dm644 hexdump-${pkgver}.1.gz  $pkgdir/usr/share/man/man1/hexdump-${pkgver}.1.gz
}
