# Author: Appcelerator, Inc. <info@appcelerator.com>
# Contributor: Jeff Haynie <jhaynie@appcelerator.com>
# Maintainer: mgoff <mgoff@appcelerator.com>
_npmname=acs
pkgname=nodejs-acs
pkgver=1.0.14
pkgrel=1
pkgdesc="Appcelerator Server Side Node"
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
