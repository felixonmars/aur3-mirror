pkgname=craftbukkit-plugin-lampcontrol
pkgver="2.4"
pkgrel=1
pkgdesc="Turn on (redstone)lamps and powered rails by clicking them, with WorldEdit or with flit"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/lampcontrol/"
license=('GPL')
depends=('craftbukkit')
source=('http://dev.bukkit.org/media/files/773/91/LampControl.jar')
md5sums=('e821f501bd8251aa805283b376a24545')

package() {
  install -Dm 644 "$srcdir/LampControl.jar" "$pkgdir/srv/craftbukkit/plugins/LampControl.jar"
}

