# Maintainer: Chris Andrews <christophersimonandrews at gmail dot com>
# Contributor: grima
pkgname=jsl
pkgver=0.3.0
pkgrel=4
pkgdesc="JavaScript Lint can check all your JavaScript source code for common mistakes without actually running the script or opening the web page."
url="http://javascriptlint.com/"
arch=(i686 x86_64)
license=('MPL')
depends=('gcc')
source=(http://www.javascriptlint.com/download/$pkgname-$pkgver-src.tar.gz)
md5sums=('2b94ffa4fab07acabe0c5e73cd49bcdf')

package() {
  cd $srcdir/jsl-$pkgver/src/
  BUILD_OPT=1 make -j1 -f Makefile.ref || return 1
  mkdir -p $pkgdir/usr/bin/
  cp Linux_All_OPT.OBJ/jsl $pkgdir/usr/bin/
}
