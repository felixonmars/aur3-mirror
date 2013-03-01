# Maintainer: Bert Voegele <bvoegelejuniorREMOVE_THE_CAPITALS@aim.com>
pkgname=networkmanager-dispatcher-strongswan-systemd
pkgver=1.0
pkgrel=2
pkgdesc="Dispatcher Script for strongSWAN (systemd support), only useful if only _one_ NM connection is active"
arch=('any')
license=('GPL')
url="http://goatse.cx"
depends=('networkmanager' \
	 'systemd' \
	 'strongswan')
optdepends=('notification-daemon: to get notifications displayed' \
	    'libnotify: to send notifications to the daemon')
provides=('networkmanager-dispatcher-strongswan')
conflicts=('networkmanager-dispatcher-strongswan')
source=('strongswan.systemd')
md5sums=('67cec690da4f70bd18fe20a78a597490')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 strongswan.systemd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-strongswan-systemd"
}
