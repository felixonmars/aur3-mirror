pkgname=bukkit-commandhelper
pkgver=3.1.2
pkgrel=1
pkgdesc="Alias lugin for Bukkit"
arch=(any)
url="http://wiki.sk89q.com/wiki/CommandHelper"
license=('GPL')
source=(https://github.com/downloads/sk89q/commandhelper/commandhelper-${pkgver}.zip)
md5sums=('cfa1de85ee4537142c40ab54e4e01e0d')

package() {
  mkdir -p "$pkgdir/usr/share/bukkit/plugins/"
  install -m 644 "$srcdir/CommandHelper.jar" "$pkgdir/usr/share/bukkit/plugins/"
}
