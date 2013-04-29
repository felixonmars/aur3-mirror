# Maintainer: Andrei Dubovik <andrei.dubovik@gmail.com>
pkgname=minido
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimalistic launcher for a gtk-based desktop."
arch=('i686' 'x86_64')
url="http://minido.sourceforge.net"
license=('GPL3')
depends=('gtk3' 'libx11')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2)
md5sums=(c2e347386d1f6a44931a64c06794ed4e)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
