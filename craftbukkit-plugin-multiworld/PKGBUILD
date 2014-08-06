pkgname=craftbukkit-plugin-multiworld
pkgver=5.2.2
pkgrel=1
pkgdesc="The easy to use multiworld plugin, support custom end and nether worlds for each worlds"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/multiworld-v-2-0"
license=("All Rights Reserved")
depends=("craftbukkit>=1.7.9")
source=("http://dev.bukkit.org/media/files/807/294/multiworld.jar")
noextract=("multiworld.jar")
md5sums=('23ba4c5dbd52b81e207720d0414e4452')

package() {
  install -Dm644 "$srcdir/multiworld.jar" "$pkgdir/srv/craftbukkit/plugins/multiworld.jar"
}

# vim:set ts=2 sw=2 et:
