# $Id: PKGBUILD 195927 2013-10-05 17:40:59Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=scute
pkgver=1.4.0
pkgrel=1
pkgdesc='A PKCS11 module that adds support for the OpenPGP smartcard card to the Mozilla Network Security Services (NSS)'
url='http://www.scute.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnupg')
source=("ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('1b280fa34a92708db0bbb371816c88c0')

install=install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/scute \
		--enable-maintainer-mode

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
