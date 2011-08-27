# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=netcfg-openvpn
pkgver=1.4
pkgrel=1
pkgdesc="OpenVPN support for netcfg2"
arch=(i686 x86_64)
url="http://code.schnouki.net/p/netcfg/"
license=('GPL')
depends=('netcfg>=2.5' 'openvpn')
source=(openvpn.example openvpn)
md5sums=('9825ea993ec7970984119d91d8a726b6'
         'd3bdb1b52080b0f43d2826ee103b128f')
sha1sums=('8935bdf60fe5e3d0540a6eb29b89e408cece6ce3'
          '2074f7f6170c3fdd94ac956554566ed47b3006fa')

build() {
  install -Dm644 $srcdir/openvpn.example $pkgdir/etc/network.d/examples/openvpn
  install -Dm755 $srcdir/openvpn $pkgdir/usr/lib/network/connections/openvpn
}

