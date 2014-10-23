# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=npth
pkgver=1.0
pkgrel=1
pkgdesc='New portable threads library'
url='http://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git'
license=('LGPL')
options=('!libtool')
arch=('i686' 'x86_64' 'armv7h')
source=("ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('3c0673144f8baffda3a3aaab3f6853acc58146c7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-maintainer-mode
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
