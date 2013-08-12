#Contributor: Lewis "mystax" Hulbert <mystax@wagn.me>
#Maintainer: Lewis "mystax" Hulbert <mystax@wagn.me>
pkgname=craftbukkit-plugin-autosort
pkgver=0.8.3
pkgrel=1
pkgdesc="Create a network of automatic item sorting chests along with one or more deposit and withdraw points!"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/autosort/"
license=("Public Domain")
depends=("craftbukkit>=1.5.2r1.0")
source=("http://dev.bukkit.org/media/files/725/126/AutoSort.jar")
noextract=("AutoSort.jar")
md5sums=('a81e15c392d1ab67e9e9fa6c39698a23')

package() {
  install -Dm644 "$srcdir/AutoSort.jar" "$pkgdir/srv/craftbukkit/plugins/AutoSort.jar"
}

# vim:set ts=2 sw=2 et:
