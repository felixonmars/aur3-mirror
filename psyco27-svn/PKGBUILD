# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname=psyco27-svn
pkgver=71410
pkgrel=1
pkgdesc="JIT compiler for Python - development branch for Python 2.7"
url="http://psyco.sourceforge.net"
arch=('i686')
license=('MIT')
depends=('python2')
makedepends=('subversion')
conflicts=('psyco')
provides=('psyco2')

_svntrunk=http://codespeak.net/svn/psyco/branch/py27/
_svnmod=psyco2

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python2 setup.py build || return 1
  python2 setup.py install --root="$pkgdir" || return 1
  install -D COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm -rf ${srcdir}/$_svnmod-build
}
