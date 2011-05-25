# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-blastcontrol
pkgver=1.0.6
pkgrel=1
pkgdesc="TNT and Creeper restrictions and modification plugin for Bukkit"
arch=(any)
url="https://github.com/happo2000/BlastControl"
license=('GPL')
depends=('craftbukkit')
source=('https://github.com/downloads/happo2000/BlastControl/BlastControl.jar')
md5sums=('5ef86a4b700ea49de5832cd75516fad4')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins"
  install -m 644 -T "$srcdir/BlastControl.jar" "$pkgdir/opt/craftbukkit/plugins/BlastControl.jar"
}

# vim:set ts=2 sw=2 et:
