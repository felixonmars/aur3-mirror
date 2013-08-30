# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Maintainer:  Artiom Molchanov <ar.molchanov@gmail.com>

pkgname=python2-pyscard
pkgver=1.6.16
pkgrel=2
pkgdesc="pyscard is a Python module adding smart cards support to Python"
arch=('i686' 'x86_64')
url="http://pyscard.sourceforge.net/"
license='LGPL'
depends=('python2' 'pcsclite')
conflicts=('pyscard')
replaces=('pyscard')
makedepends=('swig')
source=()
md5sums=()

_svnurl=https://svn.code.sf.net/p/pyscard/code/
_svn_ver=612

build() {
  cd "$srcdir"

  if [ -d $pkgname/.svn ]; then
    (cd $pkgname && svn up -r $_svn_ver)
  else
    svn co $_svnurl --config-dir ./ -r $_svn_ver $pkgname
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$pkgname-build"
  cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build/trunk/pyscard/src"

  python2 setup.py build_ext
}

package() {
  cd "$srcdir/$pkgname-build/trunk/pyscard/src"
  python2 setup.py install --prefix=$pkgdir/usr
}
