# Maintainer: Vincent Post <vincent.post@w1r3.net>
# Contributor: TesX <tesfabpel@gmail.com>
# https://github.com/w1r3/archlinux-packages
# https://git.w1r3.org/w1r3/archlinux-packages

pkgname=craftbukkit-plugin-lwc
pkgver=4.4.0
pkgrel=2
pkgdesc="A block protection plugin for Bukkit"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/lwc/"
license=('BSD')
depends=('craftbukkit>=1.5.2r1.0')
source=('http://dev.bukkit.org/media/files/718/126/LWC.jar')
md5sums=('0794cdc60c301d482f84d75f12b298d4')

package() {
  install -Dm644 "${srcdir}/LWC.jar" "${pkgdir}/srv/craftbukkit/plugins/LWC.jar"
}

# vim:set ts=2 sw=2 et:


