# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=dsromsmanager
pkgver=1.5
pkgrel=1
pkgdesc="Nintendo DS Roms Manager"
url="http://www.voria.org/dsromsmanager/"
license=('GPL3')
depends=('pygtk')
arch=('i686' 'x86_64')
source=(http://www.voria.org/files/nds/dsromsmanager/$pkgname-$pkgver.tar.gz)
md5sums=('22cbafdf478142b8c5c44c980f28756e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" trimmer_build || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:

