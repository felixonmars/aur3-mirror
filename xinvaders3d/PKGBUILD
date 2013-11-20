# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Diego Jose <diegotorre1094@hotmail.com>

pkgname=xinvaders3d
pkgver=1.3.6
pkgrel=2
pkgdesc="A vector-graphics Space Invaders clone for the X Window System."
arch=('i686' 'x86_64')
url="http://xinvaders3d.sourceforge.net/"
license=('GPL')
depends=('libx11')
source=("http://download.sourceforge.net/$pkgname/$pkgname-$pkgver.src.tar.gz" )
sha1sums=('680c81416f25548e373fdaefa1a8eb71112e049d')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 xinv3d "$pkgdir/usr/bin/xinv3d"
}
