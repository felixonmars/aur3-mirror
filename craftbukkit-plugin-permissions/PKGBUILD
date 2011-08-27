# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-permissions
pkgver=3.1.5b
pkgrel=1
pkgdesc="Permission plugin for Bukkit"
arch=(any)
url="https://github.com/TheYeti/Permissions"
license=('GPL')
depends=('craftbukkit')
source=('http://www.theyeticave.net/downloads/permissions/3.1.5/Permissions.jar')
md5sums=('9c2c0faf3f5cc650ea360f1409956b75')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins" 
  install -m 644 "$srcdir/Permissions.jar" "$pkgdir/opt/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
