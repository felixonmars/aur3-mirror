# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-plgsetspawn
pkgver=4.1
pkgrel=1
pkgdesc="Set spawn plugin for Bukkit"
arch=(any)
url="http://forums.bukkit.org/threads/admn-plgsetspawn-v4-1-setspawn-and-spawn-for-ops-766.2936/"
license=('GPL')
depends=('craftbukkit')
source=('http://plague.cz/minecraft_plugins/PlgSetspawn.jar')
md5sums=('a8e2b4cfe3ab9860767b45bcb2248437')


package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins" 
  install -m 644 "$srcdir/PlgSetspawn.jar" "$pkgdir/opt/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
