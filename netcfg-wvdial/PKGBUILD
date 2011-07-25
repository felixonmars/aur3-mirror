# Maintainer: Thypon <virus@gmx.us>
pkgname=netcfg-wvdial
pkgver=0.1
pkgrel=2
pkgdesc="WVDIAL support for NETCFG"
arch=(i686 x86_64)
url="https://github.com/thypon/netcfg-wvdial"
license=('MIT')
depends=('netcfg>=2.5' 'wvdial' 'dtach')
source=(wvdial.example wvdial)
md5sums=('8dd67017d64e465a3ee5ee9b31637b98'
         'f39ac9ef4cb81659ce871d7f7ca86b0e')

build() {
  install -Dm644 $srcdir/wvdial.example $pkgdir/etc/network.d/examples/wvdial
  install -Dm755 $srcdir/wvdial $pkgdir/usr/lib/network/connections/wvdial
}

