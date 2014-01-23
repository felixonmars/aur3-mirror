# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Michael Klier <chi@chimeric.de>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edi>

pkgname="courier-sox"
pkgver=0.12
pkgrel=1
pkgdesc="Courier Socks 5 Proxy client library"
arch=('i686' 'x86_64')
url="http://www.courier-mta.org/"
license=('GPL3')
depends=('perl' 'libtool' 'courier-authlib')
source=("http://downloads.sourceforge.net/courier/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('c9b5a09a143d43a7e7dad44ab72886c727e65d8830e26dc4256c812b87d63095c85045d24ef055d397b8bb2f427b3561d39279ebfe19fe2df6b3a765d3749904')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc --sbindir=/usr/bin
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}

# vim:ts=4:sw=4:noet:enc=utf-8:
