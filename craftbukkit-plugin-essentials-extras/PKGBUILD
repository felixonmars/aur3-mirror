# Maintainer: Vincent Post <vincent.post@w1r3.net>
# https://github.com/w1r3/archlinux-packages
# https://git.w1r3.org/w1r3/archlinux-packages

pkgname=craftbukkit-plugin-essentials-extras
pkgver=2.12.2
pkgrel=1
pkgdesc="Extra plugins for CraftBukkit Essentials"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials"
license=("GPLv3")
depends=("craftbukkit-plugin-essentials=$pkgver")
source=("http://ci.ess3.net/guestAuth/repository/download/bt3/5708:id/Essentials-extra.zip")
sha512sums=('661a2ac0f6e805442fcdaa287ed8a0bbeb51e8bbbeee661ff6ff955236c3aefd73289f80ac7d8e8f3f7fedbad6deaee3a71ab72361213ede1d88194188955fe8')

package() {
  cd ${srcdir}
  find . -name '*.jar' | xargs -rtl1 -I {} install -Dm644 {} "${pkgdir}/srv/craftbukkit/plugins/"{}
}

