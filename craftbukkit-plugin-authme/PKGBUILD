# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-authme
pkgver=0.74
pkgrel=1
pkgdesc="Alternative authorization plugin for Bukkit"
arch=(any)
url="https://github.com/fabe123/AuthMe"
license=('GPL')
depends=('craftbukkit')
source=('http://dl.dropbox.com/u/32853215/AuthMe.jar')
md5sums=('f80a9f2ded41ebb55111d4b921b71970')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins/"
  install -m 644 -T "$srcdir/AuthMe.jar" "$pkgdir/opt/craftbukkit/plugins/AuthMe.jar"
}

# vim:set ts=2 sw=2 et:
