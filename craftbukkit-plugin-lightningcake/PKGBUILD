#Contributor: Lewis "mystax" Hulbert <mystax@wagn.me>
#Maintainer: Lewis "mystax" Hulbert <mystax@wagn.me>
pkgname=craftbukkit-plugin-lightningcake
pkgver=1.0
pkgrel=2
pkgdesc="LightningCake simply spawns a pristine, moist cake where any lightning may strike. Also, one may also spontaneously spawn a lightning bolt infront of them."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/lightningcake/"
license=("WTF Public Licence")
depends=("craftbukkit>=1.5.2r1.0")
source=("http://dev.bukkit.org/media/files/586/58/LightningCake-1.0.jar")
noextract=("LightningCake-1.0.jar")
md5sums=('37b55447ab67bee44b986747598ec48c')

package() {
  install -Dm644 "$srcdir/LightningCake-1.0.jar" "$pkgdir/srv/craftbukkit/plugins/LightningCake-1.0.jar"
}

# vim:set ts=2 sw=2 et:
