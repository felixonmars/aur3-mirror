# Maintainer: TDY <tdy@archlinux.info>

pkgname=vncsnapshot
pkgver=1.2a
pkgrel=1
pkgdesc="A command line utility for saving VNC server snapshots as JPEG files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vncsnapshot/"
license=('GPL')
depends=('gcc-libs' 'libjpeg' 'zlib>=1.1.4')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.bz2)
sha256sums=('ac490c4b3810d419c65cdfb48d742ca382218c3c0f04e7868520ff9a06149ca6')

# Doesn't seem to affect my x86_64 machine, but some others report needing this patch:
# http://sourceforge.net/p/vncsnapshot/bugs/_discuss/thread/5ff92ea9/
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ $CARCH == x86_64 ]] && sed -i 's+long CARD32+int CARD32+' rfb.h
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's+usr/local+usr+' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.man1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
