pkgname=spigot-patcher
pkgver=1.0
pkgrel=2
pkgdesc="Binary patcher for distribution of Spigot and related updates."
arch=(any)
url="http://www.spigotmc.org"
license=("unknown")
depends=(java-runtime-headless spigot)
install=spigot-patcher.install
source=("http://www.spigotmc.org/spigot-updates/SpigotPatcher-$pkgver.jar"
"spigot-patcher.sh")
noextract=("SpigotPatcher-$pkgver.jar")
md5sums=('33a73112e1fa90706b96cd02c87b447a'
         'f99ff0edf804702de08da8ee0ca67782')

package() {
  install -Dm644 "$srcdir/SpigotPatcher-$pkgver.jar" "$pkgdir/srv/craftbukkit/SpigotPatcher.jar"
  install -Dm755 "$srcdir/spigot-patcher.sh" "$pkgdir/usr/bin/spigot-patcher"
}

# vim:set ts=2 sw=2 et:
