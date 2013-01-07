pkgname=craftbukkit-plugin-permissionsbukkit
pkgver=2.0
pkgrel=1
pkgdesc="The Official Default Groups Plugin."
arch=(any)
url="http://dev.bukkit.org/server-mods/permbukkit/"
license=("MIT")
depends=("craftbukkit>=1.3.1r2.0")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/624/114/PermissionsBukkit-2.0.jar")
noextract=("PermissionsBukkit-2.0.jar")
md5sums=('fb42c331e684961a061331e40a9d1dbe')

package() {
  install -Dm644 "$srcdir/PermissionsBukkit-2.0.jar" "$pkgdir/srv/craftbukkit/plugins/PermissionsBukkit.jar"
}

# vim:set ts=2 sw=2 et:
