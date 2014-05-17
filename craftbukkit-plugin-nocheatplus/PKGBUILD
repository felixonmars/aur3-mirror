# Maintainer: Vincent Post <vincent.post@w1r3.net>
# Github: https://github.com/w1r3/archlinux-packages
# Repo: http://repo.w1r3.org/w1r3-supported/

pkgname=craftbukkit-plugin-nocheatplus
pkgver=3.10.9
pkgrel=1
pkgdesc="NoCheatPlus attempts to enforce vanilla Minecraft mechanics, as well as preventing players from abusing weaknesses in Minecraft or its protocol, making your server safer "
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/nocheatplus"
license=("GPLv3")
depends=("craftbukkit")
optdepends=("craftbukkit-plugin-nocheatplus-compat: compat for using with Cititzens and mcMMO")
source=("http://dev.bukkit.org/media/files/779/45/NoCheatPlus.jar")
md5sums=('868692e7123d72c921e478dd62ad172b')
package() {
  install -Dm644 "${srcdir}/NoCheatPlus.jar" "${pkgdir}/srv/craftbukkit/plugins/"{}
}
