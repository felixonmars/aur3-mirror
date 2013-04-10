# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-ethumb-svn
_pkgname=python-ethumb
pkgver=76210
pkgrel=5
pkgdesc="Python2 bindings for Ethumb - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('python2' 'efl-svn')
makedepends=('subversion' 'cython2')
conflicts=('python2-ethumb')
provides=('python2-ethumb')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=/usr/bin/python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
