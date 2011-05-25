# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-nether
pkgver=1.2
pkgrel=1
pkgdesc="Nether plugin for craftbukkit"
arch=(any)
url="https://github.com/SpaceManiac/Nether/"
license=('MIT')
depends=('craftbukkit')
source=('https://github.com/downloads/SpaceManiac/Nether/Nether.jar')
md5sums=('6dce3f799ecc6eeb0cb6f934c9da8172')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins"
  install -m 644 "$srcdir/Nether.jar" "$pkgdir/opt/craftbukkit/plugins"
}

# vim:set ts=2 sw=2 et:
