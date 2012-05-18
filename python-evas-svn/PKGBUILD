# Maintainer: Bart van Strien <bart.bes at gmail dot com>
# Contributor: furester <furester at gmail dot com>

pkgname="python-evas-svn"
pkgver=69847
pkgrel=1
pkgdesc="Evas is a hardware-accelerated canvas API for X-Windows (Python bindings)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('evas-svn' 'python2')
makedepends=('svn' 'cython2' 'pyrex')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-evas/"
_svnmod="python-evas"

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

