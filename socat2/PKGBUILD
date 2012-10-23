# Maintainer: Stefan Haller <haliner@googlemail.com>
#
# The original PKGBUILD for socat in the official repository was written by:
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=socat2
pkgver=2.0.0beta5
_realname=socat
_realver=2.0.0-b5
pkgrel=2
pkgdesc='Multipurpose relay (development version)'
url='http://www.dest-unreach.org/socat/socat-version2.html'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('readline' 'openssl')
source=("http://www.dest-unreach.org/socat/download/${_realname}-${_realver}.tar.bz2")
sha1sums=('d75c0abc816f9bb8ee1e36f6ca4fe58d7e56f2a4')

build() {
	cd "${srcdir}/${_realname}-${_realver}"

	# This would need yodl, but that’s not available in Arch.
	msg "Prevent doc/socat.1 from being built..."
	touch doc/socat.1

	msg "Patching linux/ext2_fs.h -> ext2fs/ext2_fs.h..."
	sed -i -e 's|^AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)|AC_CHECK_HEADERS(linux/fs.h ext2fs/ext2_fs.h)|' configure.in
	sed -i -e 's|^#include <linux/ext2_fs.h>|#include <ext2fs/ext2_fs.h>|' sysincludes.h

	msg "Running autoconf..."
	autoconf

	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \

	make
}

package() {
	cd "${srcdir}/${_realname}-${_realver}"

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/usr/bin/socat"{,2}
	mv "${pkgdir}/usr/bin/filan"{,2}
	mv "${pkgdir}/usr/bin/procan"{,2}
	mv "${pkgdir}/usr/share/man/man1/socat"{,2}".1"
	sed -i -e 's/socat/socat2/g;s/filan/filan2/g;s/procan/procan2/g' \
		"${pkgdir}/usr/share/man/man1/socat2.1"
}
