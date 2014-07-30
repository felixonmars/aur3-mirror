# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Maintainer:  Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake
pkgver=3.0.0
pkgrel=2
pkgdesc="Customizable Snake game with ncurses for the terminal - stable releases"
arch=('x86_64' 'i686')
url="http://nsnake.alexdantas.net/"
license=('GPL3')
depends=('ncurses')
conflicts=('nsnake-git')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('2630435e8d029ca640cb8457918e60478ca3d9a5011c62bfda00e247dbfdcf2c')

build() {
  cd "$srcdir/nSnake-$pkgver"

  make
}

package() {
  cd "$srcdir/nSnake-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr/local" install
}
