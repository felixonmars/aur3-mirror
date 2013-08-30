pkgname=craftbukkit-plugin-marriage
epoch=1
pkgver=1.2
pkgrel=1
pkgdesc="This is a plugin that allows you to marry in minecraft to get acces to special features."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/marriage-reloaded"
license=("lenis0012's license v2")
depends=("craftbukkit>=1.6.2r0.1")
source=("http://dev.bukkit.org/media/files/728/836/Marriage.jar")
noextract=("Marriage.jar")
md5sums=('0cb28c048ab22999aeb871f6fe453635')

package() {
  install -Dm644 "$srcdir/Marriage.jar" "$pkgdir/srv/craftbukkit/plugins/Marriage.jar"
}

# vim:set ts=2 sw=2 et:
