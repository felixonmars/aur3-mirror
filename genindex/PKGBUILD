# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=genindex
pkgver=0.1.3
pkgrel=1
pkgdesc="Program to generate a VDR index file."
arch=('i686' 'x86_64')
url="http://www.vdr-wiki.de/wiki/index.php/Genindex"
license=('GPL')
depends=('vdr')
source=(http://www.muempf.de/down/$pkgname-$pkgver.tar.gz)
md5sums=('da67b1ae819bf9c064af49ab64dbf27b')

build() {
  cd ${srcdir}/$pkgname-${pkgver}
  
  make || return 1
  mkdir -p $pkgdir/usr/bin/ || return 1
  cp -r genindex $pkgdir/usr/bin || return 1

  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp COPYING $pkgdir/usr/share/doc/$pkgname || return 1  
  cp README $pkgdir/usr/share/doc/$pkgname || return 1
}
