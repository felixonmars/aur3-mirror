pkgname=craftbukkit-plugin-crazycore
pkgver=9.7.2
pkgrel=1
pkgdesc="This plugin is needed for any CrazyPlugin to work. It supports custom languages and every player can select the best fitting."
arch=(any)
url="http://dev.bukkit.org/server-mods/crazycore/"
license=("Unknown")
depends=("craftbukkit>=1.4.2")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/661/123/CrazyCore.jar")
noextract=("CrazyCore.jar")
md5sums=('4eba13d093bf2137dd23525197ce872c')

package() {
  install -Dm644 "$srcdir/CrazyCore.jar" "$pkgdir/srv/craftbukkit/plugins/CrazyCore.jar"
}

# vim:set ts=2 sw=2 et:
