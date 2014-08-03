# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Maintainer:  Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake
pkgver=3.0.1
pkgrel=1
pkgdesc="Customizable Snake game with ncurses for the terminal - stable releases"
arch=('x86_64' 'i686')
url="http://nsnake.alexdantas.net/"
license=('GPL3')
depends=('ncurses')
conflicts=('nsnake-git')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('7240dafe35e17b01134591d7ae8f09f5a375cded8b01e43ba97ca3610a09ea61')

build() {
  cd "$srcdir/nSnake-$pkgver"

  make
}

package() {
  cd "$srcdir/nSnake-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr/local" install
}
