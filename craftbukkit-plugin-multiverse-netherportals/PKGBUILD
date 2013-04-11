# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-multiverse-netherportals
pkgver=2.4
pkgrel=1
pkgdesc="Let all worlds have a nether."
arch=(any)
url="http://dev.bukkit.org/server-mods/multiverse-netherportals/"
license=("GPLv3")
depends=("craftbukkit-plugin-multiverse-core")
source=("http://dev.bukkit.org/media/files/589/64/Multiverse-NetherPortals-${pkgver}.jar")
noextract=("Multiverse-NetherPortals-${pkgver}.jar")
sha256sums=('821a8c1d69a0b6959b1df27fac1282c0fbfa38ddd55a0497608268c47af8e1fd')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
