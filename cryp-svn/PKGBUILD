# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=cryp-svn
pkgver=12
pkgrel=1
pkgdesc="A simple password management application"
arch=(any)
url="svn://svn.gafol.net/cryp/"
license=('MIT')
depends=('python' 'pygtk')
options=(!emptydirs)
makedepends=('svn')

_svntrunk=svn://svn.gafol.net/cryp/trunk
_svnmod=cryp


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
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
