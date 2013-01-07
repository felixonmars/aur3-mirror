# Contributor: Michael Asher < michael [at] wesolveeverything dot com >
# Maintainer: xduugu
pkgname=netcfg-vpnc
pkgver=1.1.1
pkgrel=1
pkgdesc="VPNC script for netcfg"
arch=(i686 x86_64)
url="http://www.archlinux.org"
license=('GPL')
depends=(netcfg vpnc)
source=(vpnc.example vpnc net-auto-vpnc README)
md5sums=('9f91cad1888ee5d5d6ebecacce38a00a'
         '6fad2f2ceb2b87faf8aa02c389e6f87c'
         'deabde8919ad65acf3dfe39d8e690d13'
         'a9609df315f89c836d02cd29261feaa9')
sha256sums=('35f283848068f65320d391679e71107e3f33812a4de4a632a01709a593b25ac9'
            'e6f3d246321635c7ff5247d499908d3d5e68da2f000931c2002a5e1811924cfd'
            '6d5c8855add7e224f61b14bde634e1fae384fe2027e4798796c0360207201735'
            'b911bc15e70514b31e63229df22ae9803389eb2eaf12dedf6c4d541383c61a83')

package() {
  install -Dm644 "$srcdir/vpnc.example" "$pkgdir/etc/network.d/examples/vpnc"
  install -Dm755 "$srcdir/vpnc" "$pkgdir/usr/lib/network/connections/vpnc"
  install -Dm755 "$srcdir/net-auto-vpnc" "$pkgdir/etc/rc.d/net-auto-vpnc"
}
