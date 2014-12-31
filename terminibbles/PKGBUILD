# Maintainer: Matthew Malensek <matt@malensek.net>
pkgname=terminibbles
pkgver=1.4
pkgrel=1
pkgdesc="A terminal snake/nibbles game"
arch=('i686' 'x86_64')
url="http://matthew.malensek.net/projects/terminibbles"
license=('BSD')
depends=('ncurses')
source=(http://matthew.malensek.net/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8cfc8474ebcbf2e286ed9d70317b5dd7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
