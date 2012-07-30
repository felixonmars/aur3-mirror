pkgname=craftbukkit-plugin-guns
pkgver=1.6
pkgrel=1
pkgdesc="Plugin for CraftBukkit that lets you add custom gun items"
arch=(any)
url="http://dev.bukkit.org/server-mods/guns/"
license=("All Rights Reserved")
depends=("craftbukkit>=1.2.5r5.0" "craftbukkit-plugin-spout>=1212")
conflicts=(craftbukkit-plugin-spout-gunpack)
provides=(craftbukkit-plugin-spout-gunpack)
source=("http://dev.bukkit.org/media/files/607/193/GunsPlus.jar")
noextract=("GunsPlus.jar")
md5sums=('ff678af7f603dcb45fdb1e3374369e4e')

package() {
	install -Dm644 "$srcdir/GunsPlus.jar" "$pkgdir/opt/craftbukkit/plugins/GunsPlus.jar"
}
