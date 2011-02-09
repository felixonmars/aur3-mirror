# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-minecart-mania-signs"
pkgver="0.15a"
pkgrel=2
pkgdesc="Adds sign controls to minecart mania."
arch=('any')
license=('CC BY-SA 3.0')
url="http://forums.bukkit.org/threads/minecart-mania.388/"
depends=('bukkit-minecart-mania-core')
source=(http://dl.dropbox.com/u/49805/MinecartManiaSignCommands.jar)
md5sums=(f780506af7d3275eaeeb5de118c0a89f)
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins/

        install -D -m755 MinecartManiaSignCommands.jar $pkgdir/etc/bukkit/plugins/
}
