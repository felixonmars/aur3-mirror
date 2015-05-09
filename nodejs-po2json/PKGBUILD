# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-po2json
_npmname=po2json
pkgver=0.3.0
pkgrel=1
pkgdesc="Convert PO files to JSON"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/mikeedwards/po2json"
license=('MIT')
provides=('nodejs-po2json' 'po2json')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
