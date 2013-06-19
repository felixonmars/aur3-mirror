
# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=openvas-scanner-systemd
pkgver=1
pkgrel=1
pkgdesc="systemd unit for OpenVAS Scanner"
arch=('any')
license=('GPLv3')
url=('http://www.openvas.org/')
depends=('openvas-scanner')
source=('openvas-scanner.service')
md5sums=('7fc683433b8d455ef0fe9e1513a0f32d')
sha1sums=('915f26c5edf12e30b8dfb124116575c5425016e4')

package() {
  install -Dm644 "${srcdir}/openvas-scanner.service" "${pkgdir}/usr/lib/systemd/system/openvas-scanner.service"
}

