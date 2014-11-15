pkgname=spigot-update
pkgver=20141113a
pkgrel=1
pkgdesc="Binary update patch for spigot.jar build 1649"
arch=(any)
url="http://www.spigotmc.org"
license=("GPLv3")
depends=(spigot-patcher)
install=spigot-update.install
source=("http://www.spigotmc.org/spigot-updates/spigot-$pkgver.bps")
md5sums=('12ace759005798adf91d9fe4675fff48')

package() {
  install -Dm644 "$srcdir/spigot-$pkgver.bps" "$pkgdir/srv/craftbukkit/patch.bps"
}

# vim:set ts=2 sw=2 et:
