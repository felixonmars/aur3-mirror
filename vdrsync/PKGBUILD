# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdrsync
pkgver=0.1.3PRE1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Demux and sync audio/video streams in VDR recordings"
url="http://vdrsync.vdr-portal.de/"
license=('GPL')
depends=('perl')
source=(http://vdrsync.vdr-portal.de/releases/$pkgname-$pkgver.tgz)
md5sums=('2efa8cef6b38d391f19c7e822c2ddec1')

build() {
  cd $startdir/src/$pkgname-$pkgver

  install -m 755 -D vdrsync.pl $startdir/pkg/usr/bin/vdrsync.pl
  install -m 755 -D vdrsync_buffer.pl $startdir/pkg/usr/bin/vdrsync.pl
  
  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp BUGS $pkgdir/usr/share/doc/$pkgname || return 1  
  cp COPYING $pkgdir/usr/share/doc/$pkgname || return 1  
  cp CHANGES $pkgdir/usr/share/doc/$pkgname || return 1
  cp MANUAL $pkgdir/usr/share/doc/$pkgname || return 1
  cp MANUAL-DE $pkgdir/usr/share/doc/$pkgname || return 1  
  cp README $pkgdir/usr/share/doc/$pkgname || return 1  
}
