# Maintainer: Michal Middleton <me@mm404.com>
pkgname=virtualbox-guest-additions-iso
pkgver=4.2.4
pkgrel=0
pkgdesc='Oracle VM VirtualBox Guest Additions ISO'
arch=('any')
url='http://www.virtualbox.org/'
license=('custom:PUEL')
depends=('virtualbox')
optdepends=('virtualbox-ext-oracle: Oracle VM VirtualBox Extension Pack')
options=('!strip')
source=("http://dlc.sun.com.edgesuite.net/virtualbox/$pkgver/VBoxGuestAdditions_$pkgver.iso"
        'PUEL')
install=
md5sums=('46fc9cf002e384fb199029c681efd7e8'
         '08b28b82d0ebd6962025100d4b5414a1')

package() {
  install -Dm 644 "VBoxGuestAdditions_$pkgver.iso" \
    "$pkgdir/usr/share/virtualbox/VBoxGuestAdditions.iso"
  install -Dm 644 PUEL "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}

# vim:set ts=2 sw=2 et:
