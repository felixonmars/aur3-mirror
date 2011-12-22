# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=networkmanager-dispatcher-sshd-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for sshd (systemd support)"
arch=('any')
license=('GPL')
url="http://script.was/written/by/me"
depends=('networkmanager' 'systemd' 'openssh')
provides=('networkmanager-dispatcher-sshd')
conflicts=('networkmanager-dispatcher-sshd')
source=('sshd.systemd')
sha512sums=('e44082dcd6e87518ecdd07e6258027948e86d9b968ce004475f352135929c0595b58a036bb4098ac3dd3a6b57b3c16bb11f87d10f6afee9539eddfc88b6a8576')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 sshd.systemd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-sshd-systemd"
}
