 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=p2p-gui
pkgver=0.2.1
pkgrel=2
pkgdesc="A remote web interface for MLdonkey, aMule, rTorrent, Transmission and giFT. (formerly known as Web-GMUI)"
arch=('i686' 'x86_64')
url="http://p2p-gui.sourceforge.net/"
license=('GPL3')
depends=('zlib' 'openssl')

_arch='linux32'
[ "$CARCH" = "x86_64" ] && _arch='linux64'

source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-${_arch}.zip)
md5sums=('5dcbfcc9fda283dcde4b46519c5497c0')
[ "$CARCH" = "x86_64" ] && md5sums[0]='fb1b027d7b572c43c2a502e444abb8ee'

build() {
  install -Dm755 $srcdir/$pkgname-$pkgver-${_arch}/$pkgname-linux $pkgdir/usr/bin/$pkgname || return 1
  mkdir -p ${pkgdir}/usr/lib/
  ln -s libssl.so ${pkgdir}/usr/lib/libssl.so.0.9.8
}
