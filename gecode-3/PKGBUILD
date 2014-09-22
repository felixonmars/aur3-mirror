# Maintainer: Logan Koester <logan at logankoester dot com>
# Contributor: Alexander Scharinger <e1028732 at student dot tuwien dot ac dot at>
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode-3
pkgver=3.7.3
pkgrel=1
pkgdesc="The Generic Constraint Development Environment"
arch=('i686' 'x86_64')
url="http://www.gecode.org"
license=('MIT')
# If qt4 is installed, gecode will compile with Gecode Interactive Search
# Tool Support (GIST).
# If you want GIST support or if you want pacman to maintain a dependency,
# cause you have qt4 already installed, then you will have to add qt4 in the
# depends array.
#depends=('mpfr' 'qt4')
depends=('mpfr')
source=(http://www.gecode.org/download/gecode-$pkgver.tar.gz)
md5sums=('7a5cb9945e0bb48f222992f2106130ac')
options=('!makeflags')

build() {
  cd "$srcdir/gecode-$pkgver"
  ./configure --prefix=/usr --disable-examples
  make
}

package() {
  cd "$srcdir/gecode-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/examples/"
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/gecode/LICENSE"
}

# vim:set ts=2 sw=2 et:
