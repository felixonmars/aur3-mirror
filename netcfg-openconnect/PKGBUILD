# Maintainer: xduugu
pkgname=netcfg-openconnect
pkgver=20111118
pkgrel=1
pkgdesc="OpenConnect support for netcfg"
arch=('any')
url="http://aur.archlinux.org"
license=('GPL')
depends=('netcfg' 'openconnect')
optdepends=('vpnc: for vpnc config script')
source=(openconnect{,.profile})
md5sums=('8884da556f8179410fa4ffeb2a3319d7'
         '0c67ec86c733ead7187839384b636931')
sha256sums=('af493bdf63ea041afe6d1774d86d39a5187a6b90450a4c03509cb19c6c82056f'
            'c1099caac63446393e2e813cf327c1b1ed4285d6fd06e28bdbd3fca22d78fa3a')

package() {
  install -Dm644 openconnect.profile "$pkgdir/etc/network.d/examples/openconnect"
  install -Dm755 openconnect "$pkgdir/usr/lib/network/connections/openconnect"
}

# vim:set ts=2 sw=2 et:
