# Contributor: Robert Orzanna <orschiro@gmail.com>
# Mainteiner: ava1ar <mail(at)ava1ar(dot)info>

pkgname=networkmanager-dispatcher-crashplan-systemd
pkgver=1.1
pkgrel=1
pkgdesc="Dispatcher Script for the Crashplan Backup service. It restarts the backup engine to avoid Waiting for connection error."
arch=('any')
license=('GPL')
url="https://github.com/orschiro/pkgbuild"
depends=('networkmanager' 'crashplan')
source=('10-crashpland')
sha1sums=('84561c7bf0d583f013f74ab63278b45cd674ff02')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/etc/NetworkManager/dispatcher.d/
  install -m700 10-crashpland "${pkgdir}"/etc/NetworkManager/dispatcher.d/10-crashpland
}
