# Maintainer: TesX <tesfabpel@gmail.com>
pkgname=craftbukkit-plugin-containerprotect
pkgver=1.09
pkgrel=2
pkgdesc="Chest protection plugin for Bukkit"
arch=(any)
url="http://forums.bukkit.org/threads/mech-containerprotect-v1-09-chest-furnace-and-dispenser-control-600-740.7175/"
license=('GPL')
depends=('craftbukkit')
source=('http://minecraft.atc.no/plugins/ContainerProtect.jar')
md5sums=('87c818e4543a9009aac8d94db60da0a7')

package() {
  mkdir -p "$pkgdir/srv/craftbukkit/plugins" 
  install -m 644 "$srcdir/ContainerProtect.jar" "$pkgdir/srv/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:

