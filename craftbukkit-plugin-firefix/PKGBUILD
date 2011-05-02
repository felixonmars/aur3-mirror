# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-firefix
pkgver=1.3.1
pkgrel=1
pkgdesc="Plugin for Bukkit"
arch=(any)
url="https://github.com/Techjar/FireFix"
license=('GPL')
depends=('craftbukkit')
source=('http://dl.dropbox.com/u/27477716/BukkitPlugins/FireFix.jar')
md5sums=('f97ce3efa70e0d512a3ef8c78b46875f')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins"
  install -m 644 "$srcdir/FireFix.jar" "$pkgdir/opt/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
