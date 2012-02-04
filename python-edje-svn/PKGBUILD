# Maintainer: Bart van Strien <bart.bes at gmail dot com>
# Contributor: furester <furester at gmail dot com>

pkgname="python-edje-svn"
pkgver=56327
pkgrel=1
pkgdesc="Ecore is an abstraction layer for e17 (Python bindings)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('edje-svn' 'python')
makedepends=('svn' 'cython' 'pyrex')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-edje/"
_svnmod="python-edje"

build() {
  cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."

  PYTHON=python2.7 PYTHONPATH=/usr/lib/python2.7/site-packages/ ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -r $srcdir/$_svnmod-build
}
