# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=xsparqler-svn
pkgver=456
pkgrel=2
pkgdesc="A prototype implementation of the XSPARQL language, which is an inclusion of SPARQL's RDF abilities into XQuery's XML manipulation."
arch=(any)
url="http://xsparql.deri.org/"
license=('GPL')
depends=('ply')
makedepends=('subversion')
provides=('xsparqler')
conflicts=('xsparqler')

_svntrunk=https://xsparql.svn.sourceforge.net/svnroot/xsparql/xsparql-python/trunk/src/
_svnmod=xsparql

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

  #
  # BUILD
  #
  msg `pwd`
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
