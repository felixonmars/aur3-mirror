# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=eliot
pkgver=2.1
pkgrel=1
pkgdesc="An open source Scrabble game that offers three different game modes (standard, duplicate and training)"
arch=(i686 x86_64)
url="http://www.nongnu.org/eliot/en/"
license=('GPL')
depends=('arabica' 'qt4' 'libconfig')
makedepends=('boost')
install="$pkgname.install"
source=("http://dl.sv.nongnu.org/releases-noredirect/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b00827bfcd64a6cc075357f3b3c34df9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix curses headers path
  sed -i "s|ncursesw[/_]||g" `grep -rl ncursesw .`

  ./configure --prefix=/usr \
              --enable-ncurses \
              --enable-qt
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
