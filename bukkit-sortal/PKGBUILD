pkgname=bukkit-sortal
pkgver=4.0.1
pkgrel=1
pkgdesc="Sign Based Teleportation Plugin for Bukkit"
arch=(any)
url="http://dev.bukkit.org/server-mods/sortal/"
license=('GPL')
source=(http://dl.dropbox.com/u/7365249/Sortal.jar)
md5sums=('ac45b05c6c213b366de6530b9f8e2a88')

package() {
  mkdir -p "$pkgdir/usr/share/bukkit/plugins/"
  install -m 644 "$srcdir/Sortal.jar" "$pkgdir/usr/share/bukkit/plugins/"
}
