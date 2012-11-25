# Maintainer: Florian Kellmer <florian.kellmer@linuxmail.org>
pkgname=netcfg-tinc
pkgver=0.1
pkgrel=1
pkgdesc="Tinc support for netcfg"
arch=(i686 x86_64)
url="https://github.com/floyd2/netcfg-tinc"
license=('MIT')
depends=('netcfg' 'tinc')
source=(tinc.example tinc)
md5sums=('b7622b0c78a980d27082c14e111453fc'
         'd5ab07a0f681b04ccb53ea28b2ed8657')

build() {
  install -Dm644 $srcdir/tinc.example $pkgdir/etc/network.d/examples/tinc
  install -Dm755 $srcdir/tinc $pkgdir/usr/lib/network/connections/tinc
}
