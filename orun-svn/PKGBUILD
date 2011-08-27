# Maintainer: Oliver Sherouse <oliver sherouse at gmail com>
pkgname=orun-svn
pkgver=44
pkgrel=2
pkgdesc="Ogden Run Dialog"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogden/"
license=('GPL')
depends=('oglib')
makedepends=('subversion')
provides=('orun')

_svntrunk="http://ogden.googlecode.com/svn/trunk/orun"
_svnmod="orun"

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

  python2 setup.py install --root="$pkgdir"

}
