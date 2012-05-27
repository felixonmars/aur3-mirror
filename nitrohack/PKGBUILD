# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel Chesters <daniel.chesters@gmail.com>
pkgname=('nitrohack')
_pkgname=NitroHack
pkgver=4.0.4
pkgrel=2
pkgdesc="A single player dungeon exploration game (Nethack fork)"
arch=('i686' 'x86_64')
url="http://www.nitrohack.org/"
license=('custom')
depends=('jansson' 'bash')
makedepends=('cmake' 'postgresql-libs')
checkdepends=()
optdepends=('postgresql-libs: For server')
source=(http://www.nitrohack.org/download/$pkgname-source-$pkgver.tar.bz2
        ncurses.patch)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 <../ncurses.patch
  cmake -DLIBDIR=/usr/lib/nitrohack -DDATADIR=/usr/share/nitrohack -DBINDIR=/usr/lib/nitrohack -DSHELLDIR=/usr/bin .
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./libnitrohack/dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
md5sums=('7dbc53230bb8bedc046cb30fc7df5138'
         '45c1b3211ced2c73e8fb956f46904697')
