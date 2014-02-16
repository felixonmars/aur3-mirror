# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Grigorios Bouzakis <grbzks@gmail.com>

pkgname=fdm-cvs
pkgver=20140215
pkgrel=1
pkgdesc='Program to fetch mail and deliver it in various ways'
url='http://fdm.sourceforge.net/'
license=('BSD')
arch=('i686' 'x86_64' 'armv7h')
depends=('openssl' 'tdb')
makedepends=('cvs')

conflicts=('fdm')

prepare() {
	cd "${srcdir}"
	cvs -z3 -d :pserver:anonymous@fdm.cvs.sourceforge.net:/cvsroot/fdm co -f fdm
}

build() {
	cd "${srcdir}/fdm"
	./configure
	make
}

package() {
	cd "${srcdir}/fdm"
	make DESTDIR="${pkgdir}" PREFIX=/usr MANDIR=/usr/share/man install
	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}"
	cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/examples/"
	sed -n '3,17p' fdm.c > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
