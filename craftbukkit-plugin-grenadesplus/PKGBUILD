pkgname=craftbukkit-plugin-grenadesplus
pkgver=1.5
pkgrel=1
pkgdesc="Plugin for CraftBukkit that lets you add custom explosive items"
arch=(any)
url="http://dev.bukkit.org/server-mods/grenadesplus"
license=("All Rights Reserved")
depends=("craftbukkit>=1.5.1r0.1" "craftbukkit-plugin-apiplus>=2.3")
source=("http://dev.bukkit.org/media/files/691/445/GrenadesPlus.jar")
noextract=("GrenadesPlus.jar")
md5sums=('9508dfdc63321ed77e1425ae8a9ad1a5')

package() {
  install -Dm644 "$srcdir/GrenadesPlus.jar" "$pkgdir/srv/craftbukkit/plugins/GrenadesPlus.jar"
}
