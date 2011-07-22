# based on libfreefare PKGBUILD by James Buckley
pkgname=libfreefare-svn
pkgver=833
pkgrel=1
pkgdesc="Provides a convenient API for MIFARE card manipulations"
arch=('i686' 'x86_64')
url="http://code.google.com/p/nfc-tools/"
license=('LGPL3')
depends=('libnfc>=1.4.0')
makedepends=('subversion')
conflicts=('libfreefare')
provides=('libfreefare')

_svntrunk=http://nfc-tools.googlecode.com/svn/trunk/libfreefare
_svnmod=libfreefare

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  autoreconf -vis
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
