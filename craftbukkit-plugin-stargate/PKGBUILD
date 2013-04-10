# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-stargate
pkgver=0.7.9.10
pkgrel=1
pkgdesc="Create custom portals from one place to another."
arch=(any)
url="http://forum.thedgtl.net/viewtopic.php?f=4&t=5"
license=("GPLv3")
depends=("craftbukkit>=1.4.7r1.0")
source=("http://thedgtl.net/bukkit/Stargate.jar")
noextract=('Stargate.jar')
sha256sums=('e7219d6ce88401d6689b185d55ad2a583b93110dad75faf122da852696299029')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
