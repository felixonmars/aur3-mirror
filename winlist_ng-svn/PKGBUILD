# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: fancris3 <fancris3 at aol.com>
# Contributor: Michele Gastaldo <pikiweb@gmail.com>

pkgname=winlist_ng-svn
_pkgname=winlist-ng
pkgver=83648
pkgrel=1
pkgdesc="Enlightenment module: A replacement for the standard winlist module"
arch=('i686' 'x86_64')
url="http://code.google.com/p/itask-module/wiki/WinlistNG"
license=('BSD')
depends=('enlightenment17<0.17.99')
makedepends=('subversion')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
}
