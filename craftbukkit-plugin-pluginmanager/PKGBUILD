# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=craftbukkit-plugin-pluginmanager
pkgver=1.0.2
pkgrel=1
pkgdesc="Load and unload plugins on a running craftbukkit server"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/pm-pluginmanager/"
license=("unknown")
depends=("craftbukkit")
source=("http://dev.bukkit.org/media/files/643/971/PluginManager.jar")
md5sums=('ac7cb36f8cb7c0cd50c3b01be412905a')

package() {
  mkdir -p "$pkgdir/srv/craftbukkit/plugins/"
  install -m644 "$srcdir/PluginManager.jar" "$pkgdir/srv/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
