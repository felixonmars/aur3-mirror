# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-autofs
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for autofs"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'autofs')
backup=(etc/NetworkManager/dispatcher.d/10-autofs)
source=("10-autofs")
sha256sums=('699b3b9ade7ce9fececea10ebf6e0cd4dab0c3c5f54cf0264437adb9482166b7')

package() {
  install -Dm700 $srcdir/10-autofs $pkgdir/etc/NetworkManager/dispatcher.d/10-autofs
}
