# Maintainer: Vincent Prelat <prelatv [at] gmail.com>

pkgname=qmagneto
pkgver=1.3.2
pkgrel=2
pkgdesc="French TV guide with record function"
url="http://biord-software.org/fr/qmagneto/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('subversion')
_revision=1.3-2
source=(http://biord-software.org/downloads/$pkgname-$_revision.zip qmagneto.desktop)
md5sums=('cceb7abebaf32c9363ae515ebaa654bb' '5962e81a0d9401a73930996b8a8ac46b')


build() {
  cd "$srcdir"/$pkgname-$_revision
  
  qmake-qt4 || return 1
  make || return 1
  
}

package() {
  cd "$srcdir"/$pkgname-$_revision
  
  #binary file
  install -d "$pkgdir/usr/"
  install -d "$pkgdir/usr/bin"
  install -m 755 "bin/qmagneto" "$pkgdir/usr/bin/qmagneto"
  
  #icon and desktop file
  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/share/pixmaps"
  install -d "$pkgdir/usr/share/applications"
  install -m 755 "resources/images/logo_qmagneto.xpm" "$pkgdir/usr/share/pixmaps/qmagneto.xpm"
  install -m 755 "$srcdir/../qmagneto.desktop" "$pkgdir/usr/share/applications/qmagneto.desktop"

}

