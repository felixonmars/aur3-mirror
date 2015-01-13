# Maintainer: Otakar Haška <ota.haska@seznam.cz>

pkgname=zima-cad-parts
_pkgname=ZIMA-CAD-Parts
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple application for searching and downloading CAD parts from ZIMA-Engineering server"
arch=('i686' 'x86_64')
url="http://www.zima-engineering.cz/projekty/ZIMA-CAD-Parts/index.html"
license=('GPL')
depends=('qt4')
source=(http://www.zima-engineering.cz/projekty/ZIMA-CAD-Parts/download/$_pkgname-$pkgver-src.tar.gz $pkgname.desktop)

build() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  qmake-qt4
  make || return 1
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cd "$srcdir/$_pkgname-$pkgver-src"
  install -m755 $_pkgname ${pkgdir}/usr/bin/

  # The .desktop shortcut...
  mkdir -p ${pkgdir}/usr/share/pixmaps ${pkgdir}/usr/share/applications
  install -m644 gfx/icon.png  ${pkgdir}/usr/share/pixmaps/zima-cad-parts.png
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

}
md5sums=('62ccdb0eb945d9c346e1b9b728cab69a'
         'abd272fc7ab200ecefec5cb440d079cc')
