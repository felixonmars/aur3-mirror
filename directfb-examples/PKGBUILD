# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Kessia 'even' Pinheiro <even@archlinux-br.org>
# Contributor: bountykiller <masse.nicolas@gmail.com>

_pkgname=DirectFB-examples
pkgname=directfb-examples
pkgver=1.7.0
pkgrel=1
pkgdesc="DirectFB example programs"
arch=('i686' 'x86_64')
url=("http://www.directfb.org")
license=("LGPL")
depends=('directfb')
source=("http://www.directfb.org/downloads/Extras/${_pkgname}-${pkgver}.tar.gz")
md5sums=('8b60c867af295481c32a8c7fc5802307')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR=${pkgdir} install
}
