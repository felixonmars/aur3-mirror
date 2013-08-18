#Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail.com>
pkgname=oglib-svn
pkgver=42
pkgrel=1
pkgdesc="Common functionality for Ogden"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogden/"
license=('GPL')
depends=('pygtk' 'python-decorator' 'pyxdg')
makedepends=('subversion')
provides=('oglib')
conflicts=('oglib')

_svntrunk="http://ogden.googlecode.com/svn/trunk/oglib"
_svnmod="oglib"

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
