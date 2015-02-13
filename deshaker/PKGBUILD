# Maintainer: David Pflug <david@tpflug.com>
pkgname=deshaker
pkgver=3.1
pkgrel=1
pkgdesc="A video stabilizer plugin for VirtualDub."
arch=('any')
url="http://www.guthspot.se/video/deshaker.htm"
license=('unknown')
depends=('virtualdub')
source=("http://www.guthspot.se/video/files/Deshaker31.zip")
sha256sums=('ecf53427ca7daf23f46209955399562fd9d859153af11fc0a632c7f271cfbb95')

package() {
  cd "$srcdir"
  install -Dm644 Deshaker.vdf "$pkgdir/usr/share/virtualdub/plugins/${pkgname}.vdf"
}

# vim:set ts=2 sw=2 et:
