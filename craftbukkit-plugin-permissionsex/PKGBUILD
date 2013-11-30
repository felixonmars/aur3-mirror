# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-permissionsex
pkgver=1.20.4
pkgrel=1
pkgdesc="Offers different backends, powerful ingame management, fine grained restrictions for world modification."
arch=(any)
url="http://dev.bukkit.org/server-mods/permissionsex/"
license=("GPLv3")
depends=("craftbukkit>=1.6.1")
source=("http://dev.bukkit.org/media/files/742/103/PermissionsEx.jar")
noextract=('PermissionsEx.jar')
sha256sums=('1c29f3ac558aa70c3b4cc9611bc64a2b85f4ea694192e316544a9f9f3703a04b')

package() {
  cd ${srcdir}
  install -Dm644 PermissionsEx.jar "$pkgdir/srv/craftbukkit/plugins/PermissionsEx.jar"
}

# vim:set ts=2 sw=2 et:
