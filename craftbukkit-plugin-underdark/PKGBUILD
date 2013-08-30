pkgname=craftbukkit-plugin-underdark
pkgver=0.2.0
pkgrel=1
pkgdesc="Underdark world generator plugin for Bukkit"
arch=(any)
url="http://dev.bukkit.org/server-mods/underdark"
license=("AGPLv3")
depends=("craftbukkit>=1.6.2r0.1")
optdepends=("craftbukkit-plugin-multiverse-core")
source=("http://dev.bukkit.org/media/files/729/590/underdark-0.2.0.jar")
noextract=("underdark-$pkgver.jar")
md5sums=('36276e0be4a6eed8a8f255b513d859f9')

package() {
  install -Dm644 "$srcdir/underdark-$pkgver.jar" "$pkgdir/srv/craftbukkit/plugins/underdark-$pkgver.jar"
}

# vim:set ts=2 sw=2 et:
