# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Maintainer:  Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake
pkgver=2.0.5
pkgrel=1
pkgdesc="Customizable Snake game with ncurses for the terminal - stable releases"
arch=('x86_64' 'i686')
url="http://nsnake.alexdantas.net/"
license=('GPL3')
depends=('ncurses' 'iniparser')
conflicts=('nsnake-git')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('ff2316cd5a6a99118bc674dba4d2aebc9726d5362a9d4df50e64bb3d352894fe')

build() {
  cd "$srcdir/nSnake-$pkgver"

  make
}

package() {
  cd "$srcdir/nSnake-$pkgver"

  # By default it installs on /usr/games
  sed -i 's|PREFIX)/games|PREFIX)/bin|g' Makefile
  make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr" install

  rm -rf $pkgdir/var
  chmod 0755 $pkgdir/usr/bin/nsnake
  chown root:root $pkgdir/usr/bin/nsnake
}
