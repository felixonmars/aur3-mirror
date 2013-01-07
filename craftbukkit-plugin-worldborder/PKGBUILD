pkgname=craftbukkit-plugin-worldborder
pkgver=1.6.1
pkgrel=1
pkgdesc="This plugin is intended to efficiently provide a border (round or square) for each of your worlds."
arch=(any)
url="http://dev.bukkit.org/server-mods/worldborder/"
license=("BSD")
depends=("craftbukkit>=1.4.2")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/649/105/WorldBorder.jar")
noextract=("WorldBorder.jar")
md5sums=('8bb6c6a28b3f132b350d22bfe45f95b2')

package() {
  install -Dm644 "$srcdir/WorldBorder.jar" "$pkgdir/srv/craftbukkit/plugins/WorldBorder.jar"
}

# vim:set ts=2 sw=2 et:
