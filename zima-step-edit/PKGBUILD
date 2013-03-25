# Maintainer: Otakar Haška <ota.haska@seznam.cz>

pkgname=zima-step-edit
_pkgname=ZIMA-STEP-Edit
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple tool for mass editing of *.STEP files headers"
arch=('i686' 'x86_64')
url="http://www.zima-engineering.cz/projekty/ZIMA-STEP-Edit/"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/project/zima-step-edit/$_pkgname-$pkgver-src.tar.gz $pkgname.desktop)

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
  install -m644 gfx/icon.png  ${pkgdir}/usr/share/pixmaps/zima-step-edit.png
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

}
md5sums=('da00fcb38a92d448454659f87a0555b1'
         '0758032e37a4c9f341cdab63e6d4faa2')
md5sums=('da00fcb38a92d448454659f87a0555b1'
         '0758032e37a4c9f341cdab63e6d4faa2')
