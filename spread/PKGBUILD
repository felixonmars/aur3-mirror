# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=spread
_pkgname=spread-daemon
pkgver=4.2.0
pkgrel=1
pkgdesc="The Spread messaging daemon"
url="http://www.spread.org"
license=('custom')
provides=($_pkgname=$pkgver)
replaces=($_pkgname)
depends=(glibc)
makedepends=()
arch=('x86_64' 'i686')
source=(spread-src-$pkgver.tar.gz liborder.patch)
md5sums=('ba6efabcbaed8cf797493f5c74802323'
         'db523eb67fb50ae03e5e693ec93be1b2')

build() {
  cd $srcdir/spread-src-$pkgver
  patch -p0 <../liborder.patch

  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/spread-src-$pkgver
  make DESTDIR=$pkgdir install
  install -D license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
