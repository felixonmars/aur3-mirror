# Maintainer: Shaun Westmacott <xyem@electricjungle.org>
# Contributor: aslag <aslag@tehlulz.com>

pkgname=netcfg-bonding
pkgver=1.5.1
pkgrel=1
pkgdesc="Support for network interface bonding for netcfg2"
arch=(any)
url="https://aur.archlinux.org/packages.php?ID=25771"
license=('GPL')
depends=('netcfg>=2.5.2' 'ifenslave')
changelog=CHANGES
install=INSTALL
source=(bonding.example bonding)
md5sums=('d64423ab70dbc50753ca8124e7b173a6'
         'a08a0ba25c510fe91fd2fc353b7fb394')

build() {
  install -Dm644 $srcdir/bonding.example $pkgdir/etc/network.d/examples/bonding
  install -Dm755 $srcdir/bonding $pkgdir/usr/lib/network/connections/bonding
}

