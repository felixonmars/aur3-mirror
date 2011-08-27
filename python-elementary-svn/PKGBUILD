# Maintainer: Bart van Strien <bart.bes at gmail dot com>
# Contributor: Andries Radu <admiral0@live.it>
# Contributor: Michele Gastaldo <pikiweb@gmail.com>
# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=python-elementary-svn
pkgver=58639
pkgrel=1
pkgdesc="Python bindings to elementary, a widget set based on evas"
url="http://trac.enlightenment.org/e/wiki/Elementary"
arch=('i686' 'x86_64')
license=(LGPL3)
depends=('elementary-svn' 'python-evas-svn')
makedepends=('subversion' 'cython' 'pyrex' 'setuptools')

_svntrunk=http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-elementary/
_svnmod=python-elementary

build() {
   cd ${srcdir}

   if [ -d $_svnmod/.svn ]; then
       (cd $_svnmod && svn up -r $pkgver)
   else
       svn co $_svntrunk --config-dir ./ $_svnmod -r $pkgver
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
