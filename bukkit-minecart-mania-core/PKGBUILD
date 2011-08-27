# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-minecart-mania-core"
pkgver="0.80a"
pkgrel=1
pkgdesc="The core of the minecart mania plugin"
arch=('any')
license=('CC BY-SA 3.0')
url="http://forums.bukkit.org/threads/minecart-mania.388/"
depends=('bukkit')
makedepends=('wget')
optdepends=('bukkit-minecart-mania-autocart: more control over minecarts')
source=(http://dl.dropbox.com/u/49805/MinecartManiaCore.jar)
md5sums=(b03fcd7af2ccfd465db076e86878d229)
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins

        install -D -m755 MinecartManiaCore.jar $pkgdir/etc/bukkit/plugins
}
