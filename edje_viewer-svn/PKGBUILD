# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Igor Scabini <furester at gmail.com>

pkgname=edje_viewer-svn
_pkgname=edje_viewer
pkgver=82148
pkgrel=1
pkgdesc="Simple viewer for edj files"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('elementary')
makedepends=('subversion')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/$_pkgname")
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
}
