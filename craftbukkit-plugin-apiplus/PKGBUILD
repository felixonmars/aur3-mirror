pkgname=craftbukkit-plugin-apiplus
pkgver=2.3
pkgrel=1
pkgdesc="Easy way for developers to create plugins that are adding custom items and blocks through Spout."
arch=(any)
url="http://dev.bukkit.org/server-mods/apiplus"
license=("All Rights Reserved")
depends=("craftbukkit>=1.5.1r0.1" "craftbukkit-plugin-spout>=1439")
source=("http://dev.bukkit.org/media/files/691/151/ApiPlus.jar")
noextract=("ApiPlus.jar")
md5sums=('d43fadfd15ec13adcd2bc19318449a3a')

package() {
  install -Dm644 "$srcdir/ApiPlus.jar" "$pkgdir/srv/craftbukkit/plugins/ApiPlus.jar"
}
