# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-multiverse-portals
pkgver=2.5
pkgrel=1
pkgdesc="Create portals to other worlds."
arch=(any)
url="http://dev.bukkit.org/server-mods/multiverse-portals/"
license=("GPLv3")
depends=("craftbukkit-plugin-multiverse-core")
source=("http://dev.bukkit.org/media/files/771/760/Multiverse-Portals-${pkgver}.jar")
noextract=("Multiverse-Portals-${pkgver}.jar")
sha256sums=('456b3b9ec9769a0ad9329b4619dd277dbb10c472063874d8e887cfbdd55a0a18')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
