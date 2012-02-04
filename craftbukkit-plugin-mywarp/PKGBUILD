# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-mywarp
pkgver=2.0dev
pkgrel=1
pkgdesc="Warp plugin for craftbukkit"
arch=(any)
url="https://github.com/flames/MyWarp"
license=('GPL')
depends=('craftbukkit')
source=('http://procrafter.de/downloads/MyWarp.jar')
md5sums=('9a2fd2d048b6e9fdfd2fc14b351b6429')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins"
  install -m 644 "$srcdir/MyWarp.jar" "$pkgdir/opt/craftbukkit/plugins"
}

# vim:set ts=2 sw=2 et:
