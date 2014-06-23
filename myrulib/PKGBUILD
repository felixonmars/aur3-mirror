# Contributor: Artem Sereda <overmind88@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=myrulib
pkgver=0.29.16
pkgrel=2
pkgdesc="Home library with lib.rus.ec site support"
arch=('i686' 'x86_64')
url="http://www.lintest.ru/wiki/MyRuLib"
license=('GPL')
depends=('wxgtk2.8' 'expat' 'sqlite3')
source=(http://www.lintest.ru/pub/${pkgname}\-${pkgver}.tar.bz2)
sha1sums=('366c497a63203367b3a90a9b62320fee557a06e0')
 
build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
	make
}
 
package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
