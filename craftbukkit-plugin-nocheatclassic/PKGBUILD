# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-nocheatclassic
pkgver=3.6.4
pkgrel=1
pkgdesc="Prevent cheating on your Craftbukkit server."
arch=(any)
url="http://dev.bukkit.org/server-mods/nocheat-classic/"
license=("GPLv3")
depends=("craftbukkit>=1.4.7r1.0")
source=("http://dev.bukkit.org/media/files/661/653/NoCheatClassic.jar")
noextract=('NoCheatClassic.jar')
sha256sums=('6fd790589bf4297b81ad8afdac335d685aa94792c2c928197553ddb1f4df921e')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
