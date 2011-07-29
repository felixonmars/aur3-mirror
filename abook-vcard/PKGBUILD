# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgname=abook
pkgname=$_pkgname-vcard
pkgver=0.6.0pre2
pkgrel=1
pkgdesc='Text-based addressbook designed for use with Mutt, with vcard patch'
arch=('i686' 'x86_64')
url='http://abook.sourceforge.net/'
license=('GPL2')
depends=('readline')
provides=('abook')
conflicts=('abook')
source=("http://abook.sourceforge.net/devel/abook-${pkgver}.tar.gz"
		"http://abook.sourceforge.net/patches/abook_vcard_import.patch")
sha256sums=('59d444504109dd96816e003b3023175981ae179af479349c34fa70bc12f6d385'
            '42344474cf8ad64d7937aa20d322b0e5f39736c51445d803a05f0733ee7ce5c1')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 < ../abook_vcard_import.patch
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
