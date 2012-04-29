# Maintainer: Vasil Yonkov <bustervill@gmail.com>
pkgname=networkmanager-dispatcher-ntpd-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for ntpd (systemd support)"
arch=('any')
license=('GPL')
url="http://script.was/written/by/me"
depends=('networkmanager' 'systemd' 'ntp')
conflicts=('networkmanager-dispatcher-ntpd')
source=('ntpd.systemd')
md5sums=('3c36fd522191b9e63120dc71fcc374fc')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 ntpd.systemd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-ntpd-systemd"
}

# vim:set ts=2 sw=2 et:
