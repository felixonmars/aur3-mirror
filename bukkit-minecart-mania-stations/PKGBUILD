# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-minecart-mania-stations"
pkgver="0.21a"
pkgrel=1
pkgdesc="Adds station controls to minecart mania."
arch=('any')
license=('CC BY-SA 3.0')
url="http://forums.bukkit.org/threads/minecart-mania.388/"
depends=('bukkit-minecart-mania-core')
makedepends=('wget')
source=(http://dl.dropbox.com/u/49805/MinecartManiaStation.jar)
md5sums=(7c614cdd39c93c7497f85e1cc82673a8)
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins/

        install -D -m755 MinecartManiaStation.jar $pkgdir/etc/bukkit/plugins/
}
