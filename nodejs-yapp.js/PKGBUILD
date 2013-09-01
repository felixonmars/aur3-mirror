# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-yapp.js
_npmname=yapp.js
pkgver=0.1.0
pkgrel=1
pkgdesc="Client-side framework for structured applications"
arch=('any')
depends=('nodejs')
url="http://friendcode.github.io/yapp.js/"
license=('MIT')
provides=('nodejs-yapp.js')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
