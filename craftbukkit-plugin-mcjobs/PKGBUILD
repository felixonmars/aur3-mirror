pkgname=craftbukkit-plugin-mcjobs
pkgver=3.1.8
pkgrel=1
pkgdesc="These jobs earn you money for your server economy."
arch=(any)
url="http://dev.bukkit.org/server-mods/mcjobs/"
license=("All Rights Reserved")
depends=("craftbukkit-plugin-vault")
conflicts=()
provides=()
replaces=()
source=("http://dev.bukkit.org/media/files/626/421/mcjobs.jar")
noextract=("mcjobs.jar")
md5sums=('3ee3c4a79eac91d85149f928c901121f')

package() {
  install -Dm644 "$srcdir/mcjobs.jar" "$pkgdir/srv/craftbukkit/plugins/mcjobs.jar"
}

# vim:set ts=2 sw=2 et:
