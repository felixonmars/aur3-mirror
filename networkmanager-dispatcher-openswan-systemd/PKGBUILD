# Maintainer: Bert Voegele <bvoegelejuniorREMOVE_THE_CAPITALS@aim.com>
pkgname=networkmanager-dispatcher-openswan-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for OpenSWAN (systemd support), only useful if only _one_ NM connection is active"
arch=('any')
license=('GPL')
url="http://goatse.cx"
depends=('networkmanager' 'systemd' 'openswan')
provides=('networkmanager-dispatcher-openswan')
conflicts=('networkmanager-dispatcher-openswan')
source=('openswan.systemd')
md5sums=('05fb12d6ff9c99d8f7431500523ab75d')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 openswan.systemd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openswan-systemd"
}
