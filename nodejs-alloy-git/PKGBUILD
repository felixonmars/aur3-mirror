# Author: Appcelerator, Inc. <info@appcelerator.com>
# Maintainer: tonylukasavage <anthony.lukasavage@gmail.com>
# Maintainer: cb1kenobi <chris@cb1inc.com>
# Maintainer: ingo <ingo@muschenetz.com>
# Maintainer: mxia <mxia@appcelerator.com>
_npmname=alloy
_repo="git://github.com/appcelerator/alloy.git"
pkgname=nodejs-$_npmname-git
pkgver=1.5.0_dev
pkgrel=1
pkgdesc="Appcelerator Titanium MVC Framework (last dev version)"
arch=(any)
url="https://github.com/appcelerator/alloy"
license=(Apache Public License v2)
depends=('nodejs')
conflicts=('nodejs-alloy')
provides=('nodejs-alloy')
optdepends=()

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_repo 
}
