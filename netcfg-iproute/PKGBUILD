# Maintainer: Alexander Zubkov <green@msu.ru>
pkgname=netcfg-iproute
pkgver=0.4
pkgrel=1
pkgdesc="Simple netcfg iproute support: vlans, no fail on link down."
arch=(any)
license=('GPL')
depends=('netcfg' 'iproute2')
url="http://archlinux.org"
source=(iproute iproute.example)
md5sums=('6033745569fc2a72a41618bba2680e33'
         '6b8d57262ae2774d29bff94f2a0ef793')

package() {
    DST="$pkgdir/usr/lib/network/connections"
    mkdir -p "$DST"
    cp iproute "$DST"
    chmod 755 "$DST/iproute"

    DST="$pkgdir/etc/network.d/examples"
    mkdir -p "$DST"
    cp iproute.example "$DST/iproute"
}

# vim: ts=4:sw=4:et:
