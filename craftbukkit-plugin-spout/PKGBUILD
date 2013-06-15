pkgname=craftbukkit-plugin-spout
pkgver=1458
pkgrel=1
pkgdesc="Spout plugin for CraftBukkit"
arch=(any)
url="http://www.spout.org"
license=("LGPLv3")
depends=("craftbukkit>=1.5.2r1.0")
source=("http://get.spout.org/spoutplugin.jar")
noextract=("spoutplugin.jar")
md5sums=('96c14c884ca025e70e882c6dbfd0977c')

package() {
  install -Dm644 "$srcdir/spoutplugin.jar" "$pkgdir/srv/craftbukkit/plugins/spoutplugin.jar"
}
