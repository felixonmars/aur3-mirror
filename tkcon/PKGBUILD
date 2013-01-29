# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=tkcon
pkgver=2.5
pkgrel=2
pkgdesc="TkCon is an enhanced interactive console for developing in Tcl."
url="http://tkcon.sourceforge.net"
license="BSD"
arch=(i686 x86_64)
depends=(tcl tk)
makedepends=(cvs)
source=(tkcon
        http://sourceforge.net/projects/tkcon/files/tkcon/2.5/tkcon-2.5.tar.gz)

build() {
    true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/share/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1 
  mkdir -p $pkgdir/usr/share/man/mann
  cp -rf $srcdir/$pkgname-$pkgver/docs $pkgdir/usr/share/$pkgname-$pkgver/
  cp $srcdir/$pkgname-$pkgver/index.html $pkgdir/usr/share/$pkgname-$pkgver/
  cp $srcdir/$pkgname-$pkgver/tkcon.tcl $pkgdir/usr/share/$pkgname-$pkgver/
  cp $srcdir/$pkgname-$pkgver/docs/*.n.man $pkgdir/usr/share/man/mann/
  cp $srcdir/$pkgname-$pkgver/docs/*.1.man $pkgdir/usr/share/man/man1/
  install -m755 $srcdir/tkcon $pkgdir/usr/bin/
}
md5sums=('86eb121cb67b97f807fad5bd762d3549'
         '7d8e83727b8f9630d1b7e233cda145af')
