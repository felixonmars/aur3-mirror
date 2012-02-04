# Maintainer: Shanto

pkgname=networkmanager-dispatcher-groupvpn
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for GroupVPN"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager')
source=(10-groupvpn)
md5sums=('3993043746dda187e40efabebe2d4986')

package() {
  install -Dm700 $srcdir/10-groupvpn $pkgdir/etc/NetworkManager/dispatcher.d/10-groupvpn
}
