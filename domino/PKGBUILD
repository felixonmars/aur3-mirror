# created 05:31:15 - 30/09/09
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=domino
pkgver=1.1.2
pkgrel=1
pkgdesc="Tile-based game"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/darkwalkerrzn/"
license=('GPL')
depends=('qt')
source=(http://sites.google.com/site/darkwalkerrzn/domino_$pkgver.tar.gz domino.sh domino.desktop)
md5sums=('46cc54334c8bbd4e3ef85fc2d5588c1e'
         'de52fb175cc7afe47853cc3248a65f24'
         '234c3a2725595b2d32a6e8d28435d1dc')

build() {

  cd $srcdir/$pkgname

  qmake || return 1
  make || return 1

  install -Dm755 domino $pkgdir/opt/domino/domino || return 1
  install -Dm755 ../domino.sh $pkgdir/usr/bin/domino || return 1
  install -Dm644 *.png $pkgdir/opt/domino/ || return 1
  install -dm755 $pkgdir/opt/domino/dices || return 1
  install -m644 dices/* $pkgdir/opt/domino/dices || return 1
  install -Dm644 ../domino.desktop $pkgdir/usr/share/applications/domino.desktop || return 1

}