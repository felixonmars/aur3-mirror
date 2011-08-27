# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-minecart-mania-autocart"
pkgver="0.54a"
pkgrel=1
pkgdesc="In cart controls"
arch=('any')
license=('CC BY-SA 3.0')
url="http://forums.bukkit.org/threads/minecart-mania.388/"
depends=('bukkit-minecart-mania-core')
source=(http://dl.dropbox.com/u/49805/MinecartManiaAutocart.jar)
md5sums=(db22b958464977c0cd684761c29e6f4d)
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins/

        install -D -m755 MinecartManiaAutocart.jar $pkgdir/etc/bukkit/plugins/
}
