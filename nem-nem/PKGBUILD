# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=nem-nem
pkgver=2011.05.1
pkgrel=2
pkgdesc="A dice game, a variant of Yahtzee."
url="http://code.google.com/p/nem-nem/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt4')
source=(http://nem-nem.googlecode.com/files/${pkgname}-${pkgver}.tar.gz nem-nem.desktop)
md5sums=('82e2d29cc8a5fdb2e4ee628ab545cfa8'
         '1842643030e83708fb10d04fb5676049')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}
  mkdir -p ${pkgdir}/usr/bin
  qmake-qt4
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 nem-nem ${pkgdir}/usr/bin/nem-nem
  install ../nem-nem.desktop ${pkgdir}/usr/share/applications
  install images/nem-nem.png ${pkgdir}/usr/share/pixmaps/nem-nem.png
}
