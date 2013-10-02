# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=basqet
pkgver=0.2.0
pkgrel=3
pkgdesc="Note taking application. Collect notes in baskets."
arch=('i686' 'x86_64')
url="http://code.google.com/p/basqet/"
license=('GPL3')
depends=('qt4')
source=(http://basqet.googlecode.com/files/${pkgname}_${pkgver}-src.tgz)
md5sums=('aa28e218a6a393ede556f8c8542bd8fe')

prepare() {
  cd $srcdir/release_${pkgver}
  qmake-qt4
}

build() {
  cd $srcdir/release_${pkgver}
  make
}

package(){
  cd $srcdir/release_${pkgver}
  
  # Binary
  install -Dm755 basqet $pkgdir/usr/bin/basqet

  # Desktop icon
  install -Dm644 basqet.desktop $pkgdir/usr/share/applications/basqet.desktop
  install -Dm644 resources/basqet.png $pkgdir/usr/share/pixmaps/basqet.png
}
