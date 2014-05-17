# Maintainer: Vincent Post <vincent.post@w1r3.net>
# https://github.com/w1r3/archlinux-packages

pkgname=craftbukkit-plugin-essentials-gm
pkgver=2.13.1
pkgrel=1
pkgdesc="Group manager plugins for CraftBukkit Essentials"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials"
license=("GPLv3")
depends=("craftbukkit-plugin-essentials")
source=("http://ci.ess3.net/guestAuth/repository/download/bt3/5995:id/Essentials-gm.zip")
sha512sums=('2c30c7cf0caa71b615fc34bd3484f9cb4d5b1a1af481d3312544f5f842717225ba60d08013c9a82f5c56026c14e27838b8c73466d08d24ebcf4a8671322b80f2')

package() {
  install -Dm644 "${srcdir}/EssentialsGroupManager.jar" "${pkgdir}/srv/craftbukkit/plugins/EssentialsGroupManager.jar"
}

# vim:set ts=2 sw=2 et:
