# Maintainer: cgb <jens at 0x6a dot de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgname=abook
pkgname=$_pkgname-call
pkgver=0.6.0pre2
pkgrel=1
pkgdesc='Text-based addressbook designed for use with Mutt, with call functionality'
arch=('i686' 'x86_64')
url='http://abook.sourceforge.net/'
license=('GPL2')
depends=('readline')
provides=('abook')
conflicts=('abook')
source=("http://abook.sourceforge.net/devel/abook-${pkgver}.tar.gz"
		"https://raw.github.com/c-g-b/abook-call/master/${pkgname}-${pkgver}.patch")
sha256sums=('59d444504109dd96816e003b3023175981ae179af479349c34fa70bc12f6d385'
            'f3e0649f38c47ba0eea4e1b74ef42be828d32c49b6c0d0cdeecf64b2244dca37')
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 < ../${pkgname}-${pkgver}.patch
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
