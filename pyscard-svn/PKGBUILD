# Maintainer: s1gma <s1gma@mindslicer.com>

pkgname=pyscard-svn
pkgver=587
pkgrel=1
pkgdesc="pyscard is a Python module adding smart cards support to Python"
arch=('i686' 'x86_64')
url="http://pyscard.sourceforge.net/"
license=('LGPL')
depends=('python2' 'pcsclite')
makedepends=('swig' 'subversion')
source=()
md5sums=()
conflicts=('pyscard')

_svntrunk=https://pyscard.svn.sourceforge.net/svnroot/pyscard
_svnmod=pyscard

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
  cd "$srcdir/$_svnmod-build/trunk/$_svnmod/src"

  python2 setup.py build_ext
}

package() {
  cd "$srcdir/$_svnmod-build/trunk/$_svnmod/src"
  python2 setup.py install --prefix=$pkgdir/usr
}
