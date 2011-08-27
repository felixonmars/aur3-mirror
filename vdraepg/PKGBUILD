# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdraepg
pkgver=0.2.1
pkgrel=2
pkgdesc="VDR-addon to copy VDR's EPG data from one channel to another"
arch=('i686' 'x86_64')
url="http://www.vdrportal.de/board/thread.php?postid=632294"
license=('GPL')
depends=('vdr' 'ruby' 'perl')
source=('http://www.vdrportal.de/board/attachment.php?attachmentid=15774&sid=d8b2b2e41acce8bba7cad87fa8164061')
md5sums=(495cab16150743b0bb2488ce718053a6)

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1

  cat ../../arch.diff |patch -p1
  
  mkdir -p $pkgdir/usr/bin || return 1
  cp -r vdraepg.rb $pkgdir/usr/bin/ || return 1
  cp -r utils/* $pkgdir/usr/bin/ || return 1
  
  mkdir -p $pkgdir/etc/vdraepg || return 1
  cp -r vdraepg.conf $pkgdir/etc/vdraepg || return 1

  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r COPYRIGHT $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r HISTORY $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r README $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r README.en $pkgdir/usr/share/doc/$pkgname || return 1
}
