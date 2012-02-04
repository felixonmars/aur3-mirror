# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: multimedia

pkgname=rogg
pkgver=0.4
pkgrel=1
pkgdesc="Raw Ogg file library and utilities"
license="GPL"
depends=(libogg libvorbis)
url="http://svn.xiph.org/releases/rogg/"
arch=(i686 x86_64)
source=(http://svn.xiph.org/releases/rogg/$pkgname-$pkgver.tar.gz)
md5sums=('4f5d925923021e0ed6db02ef7ea9f8fe')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/lib
  mkdir -p $startdir/pkg/usr/include
  for binary in rogg_crcfix rogg_eosfix rogg_pagedump rogg_serial rogg_stats rogg_theora ; do
    install -m 0755 $binary $startdir/pkg/usr/bin/
  done
  install -m 0644 librogg.a $startdir/pkg/usr/lib/
  install -m 0644 rogg.h $startdir/pkg/usr/include/
}
