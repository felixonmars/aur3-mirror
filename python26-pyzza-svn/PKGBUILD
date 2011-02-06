# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=python26-pyzza-svn
pkgver=100
pkgrel=1
pkgdesc="A python-like programming language targeting Flash platform"
arch=(any)
url="http://pyzza.gafol.net"
license=('MIT')
depends=('python')
options=(!emptydirs)
makedepends=('svn' 'python')

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
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  pushd $startdir/pkg/usr/bin
  mv pyzza-compile pyzza-compile-2.6
  mv pyzza-cook pyzza-cook-2.6
  mv pyzza-make pyzza-make-2.6
  mv pyzza-swf pyzza-swf-2.6
  popd

}
