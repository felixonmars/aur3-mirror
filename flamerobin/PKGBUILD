# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=flamerobin
pkgver=0.9.2
pkgrel=3
pkgdesc='A tool to handle Firebird database management'
arch=('i686' 'x86_64')
url="http://www.flamerobin.org/"
license=('expat')
depends=('wxgtk' 'libfbclient')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('b674a1de1c632c834e904a17e576498850e7b81cc5c4d42e8cafd8a6dd020c90')

build() {
	cd "${pkgname}-${pkgver}-src"

	CXXFLAGS=-fpermissive ./configure \
	--prefix=/usr \
	--with-wx-config=/usr/bin/wx-config

	make
}

package() {
	cd "${pkgname}-${pkgver}-src"

	make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: