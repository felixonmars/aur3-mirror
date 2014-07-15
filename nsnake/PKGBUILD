# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Maintainer:  Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake
pkgver=2.0.8
pkgrel=1
pkgdesc="Customizable Snake game with ncurses for the terminal - stable releases"
arch=('x86_64' 'i686')
url="http://nsnake.alexdantas.net/"
license=('GPL3')
depends=('ncurses' 'yaml-cpp')
conflicts=('nsnake-git')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('adaa847e3e043187ad37864a128330cb69086702ac20575fd587115258c8fabb')

build() {
  cd "$srcdir/nSnake-$pkgver"

  make
}

package() {
  cd "$srcdir/nSnake-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr/local" install
}
