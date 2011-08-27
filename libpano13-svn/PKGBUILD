# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=libpano13-svn
pkgver=1304
pkgrel=1
pkgdesc="Basic library to calculate panoramical pictures - core functions of the panotools"
url="http://panotools.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libpng' 'libtiff')
makedepends=('subversion')
provides=('libpano13=2.9.17')
conflicts=('libpano13')
options=(!libtool)
source=()
md5sums=()

_svntrunk="https://panotools.svn.sourceforge.net/svnroot/panotools/trunk/libpano"
_svnmod="panotools"

build() {
  cd "$srcdir"
  msg "Connecting to $_svnmod.sourceforge.net SVN server...."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_svnmod-build ]; then
    rm -rf "$srcdir"/$_svnmod-build
  fi

  mkdir -p "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build

  "$srcdir"/$_svnmod/bootstrap --prefix=/usr --with-java=no --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/$_svnmod-build
  make DESTDIR="$pkgdir" install
}
