# Maintainer: rayman2200 <info@rayman2200.de>
# Contributor: Vincent Post <vincent.post@w1r3.net>
# Contributor: Schala

pkgname=craftbukkit-plugin-essentials-full
pkgver=2.13.1.5
_build=5947
epoch=2
pkgrel=1
pkgdesc="Essentials offers about 100 commands useful on just about every server, from kits to mob spawning. This package includes the essentials, essentials-extras and essentials-gm package."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials/"
license=("GPLv3")
depends=("craftbukkit")
conflicts=("craftbukkit-plugin-essentials-extras"
           "craftbukkit-plugin-essentials-gm"
           "craftbukkit-plugin-essentials")
provides=("craftbukkit-plugin-essentials-extras=${pkgver}"
          "craftbukkit-plugin-essentials-gm=${pkgver}"
          "craftbukkit-plugin-essentials=${pkgver}")
source=("http://ci.ess3.net/guestAuth/repository/download/bt9/${_build}:id/Essentials-full.zip")
md5sums=('40af1026f83cbe4a975710b729334c23')

package() {
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "${pkgdir}/srv/craftbukkit/plugins/"{}
}

# vim:set ts=2 sw=2 et:
