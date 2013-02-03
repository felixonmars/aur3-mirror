# Contributor: Andy Coder <aacoder@owu.edu>

pkgname=ypsilon-svn
pkgver=506
pkgrel=1
pkgdesc="The implementation of R6RS Scheme Programming Language for real-time applications"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ypsilon/"
license=('custom:BSD')
provides=('ypsilon')
conflicts=('ypsilon')
depends=('gcc-libs')
makedepends=('cpio' 'subversion')

_svntrunk=http://ypsilon.googlecode.com/svn/trunk/
_svnmod=ypsilon-read-only

build() {
  cd $srcdir
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  [ -d $srcdir/${_svnmod}-build ] && rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  msg "SVN checkout done or timed out!"
  msg "Starting build..."
  
  cd "$_svnmod-build"
  make PREFIX=/usr
}
package() { 
  cd "$srcdir/$_svnmod-build"
  make PREFIX=/usr -j1 DESTDIR=$pkgdir install 
  install -D -m644 $srcdir/$_svnmod/license.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
