# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=pyzza-svn
pkgver=75
pkgrel=1
pkgdesc="A python-like programming language targeting Flash platform"
arch=(any)
url="http://pyzza.gafol.net"
license=('MIT')
depends=('python3')
options=(!emptydirs)
makedepends=('svn')

_svntrunk=svn://svn.gafol.net/pyzza/trunk
_svnmod=pyzza


build() {  cd "$srcdir"

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
  python3 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
