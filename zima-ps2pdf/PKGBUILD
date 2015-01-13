# Maintainer: Otakar Haška <ota.haska@seznam.cz>

pkgname=zima-ps2pdf
_pkgname=ZIMA-PS2PDF
pkgver=1.1.0
pkgrel=1
pkgdesc="Qt4 GUI for ps2pdf"
arch=('i686' 'x86_64')
url="http://www.zima-engineering.cz/projekty/ZIMA-PS2PDF/"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/project/zima-ps2pdf/$pkgver/$_pkgname-$pkgver-src.tar.gz $pkgname.desktop)

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
  install -m644 gfx/zima-ps2pdf.png  ${pkgdir}/usr/share/pixmaps/zima-ps2pdf.png
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

}
md5sums=('3118fcdfdaa512d9aa86cab98d0f3de8'
         '714c688e62e68a5088b1914123284977')
