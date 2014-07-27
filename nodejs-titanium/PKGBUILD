# Author: Appcelerator, Inc. <npmjs@appcelerator.com>
# Maintainer: tonylukasavage <anthony.lukasavage@gmail.com>
# Maintainer: cb1kenobi <chris@cb1inc.com>
# Maintainer: appcelerator <npmjs@appcelerator.com>
_npmname=titanium
pkgname=nodejs-titanium
pkgver=3.3.0
pkgrel=1
pkgdesc="Appcelerator Titanium Command line"
arch=(any)
url="https://github.com/appcelerator/titanium"
license=(Apache Public License v2)
depends=('nodejs')
optdepends=()

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
