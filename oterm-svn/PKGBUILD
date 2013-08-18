# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
pkgname=oterm-svn
pkgver=38
pkgrel=1
pkgdesc="Ogden Terminal Emulator"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogden/"
license=('GPL')
depends=('vte' 'oglib')
makedepends=('subversion')
provides=('oterm')

_svntrunk="http://ogden.googlecode.com/svn/trunk/oterm"
_svnmod="oterm"

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
