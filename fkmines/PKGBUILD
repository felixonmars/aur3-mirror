# Maintainer: evertonstz
pkgname=fkmines
pkgver=0.2
pkgrel=1
pkgdesc="A minesweeper clone for linux terminals using ncurses."
arch=('any')
url="http://sourceforge.net/projects/fkmines/"
license=('GPL')
depends=()
source=(http://ufpr.dl.sourceforge.net/project/$pkgname/Version%200.2/$pkgname-$pkgver.tar.gz)
md5sums=('e5c869b3022dd0fb7cbe7789e3ee617c')

build() {
  cd "$srcdir/$pkgname-$pkgver"  
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
