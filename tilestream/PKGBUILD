# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=tilestream
pkgver=1.1.0
pkgrel=1
pkgdesc="A high performance tile server and simple web viewer for MBTiles files."
arch=(any)
url="https://github.com/mapbox/tilestream"
license=(BSD)
depends=(nodejs6)
source=()
md5sums=()

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
# vim:set ts=2 sw=2 et:
