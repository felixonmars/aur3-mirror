# Maintainer: Vincent Post <vincent.post@w1r3.net>
# Contributor: Schala
# https://github.com/w1r3/archlinux-packages

pkgname=craftbukkit-plugin-essentials
pkgver=2.13.1
pkgrel=1
pkgdesc="Essentials offers about 100 commands useful on just about every server, from kits to mob spawning."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials/"
license=("GPLv3")
depends=("craftbukkit") 
optdepends=("craftbukkit-plugin-essentials-extras: Extras for Essentials"
            "craftbukkit-plugin-essentials-gm: GroupManager for Essentials")
source=("http://dev.bukkit.org/media/files/780/922/Essentials.zip")
md5sums=('839a9e31a85989a69030a68fa44d5d35')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
