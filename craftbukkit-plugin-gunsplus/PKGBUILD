pkgname=craftbukkit-plugin-gunsplus
pkgver=1.9
pkgrel=1
pkgdesc="Plugin for CraftBukkit that lets you add custom gun items"
arch=(any)
url="http://dev.bukkit.org/server-mods/guns"
license=("All Rights Reserved")
depends=("craftbukkit>=1.5.1r0.1" "craftbukkit-plugin-apiplus>=2.3")
source=("http://dev.bukkit.org/media/files/691/153/GunsPlus.jar")
noextract=("GunsPlus.jar")
md5sums=('05f8b401ac4f93349f31af60c8acc6fd')

package() {
  install -Dm644 "$srcdir/GunsPlus.jar" "$pkgdir/srv/craftbukkit/plugins/GunsPlus.jar"
}
