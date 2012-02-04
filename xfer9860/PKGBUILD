pkgname=xfer9860
pkgver=71
pkgrel=1
pkgdesc="CASIO fx-9860G file trasnfer tool"
url="http://sourceforge.net/apps/trac/fxsdk/wiki/xfer9860"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libusb')
makedepends=('scons' 'subversion')

_svntrunk="https://xfer9860.svn.sourceforge.net/svnroot/xfer9860/xfer9860/tags/release-0.2.1/"
 
build() {
  cd "$srcdir"
  
 if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver xfer9860
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting scons..."
  cd "$srcdir/xfer9860"
  pwd
  scons
}
 
package() {
  cd "$srcdir/xfer9860"
  mkdir -p $pkgdir/usr/bin
  cp src/xfer9860 $pkgdir/usr/bin/xfer9860
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
