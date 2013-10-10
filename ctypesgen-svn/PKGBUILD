# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=ctypesgen-svn
pkgver=151
pkgrel=0
pkgdesc="A pure-python wrapper generator for ctypes"
arch=('any')
url="http://code.google.com/p/ctypesgen/"
license=('BSD')
depends=('python2')
makedepends=('subversion')
provides=('ctypesgen')

_svntrunk=http://ctypesgen.googlecode.com/svn/trunk/
_svnmod=ctypesgen

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

   python2 setup.py build
}

package() {
   cd "${srcdir}/ctypesgen-build"
   python2 setup.py install --root=$pkgdir/ --optimize=1
}
