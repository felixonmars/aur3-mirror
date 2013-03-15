# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-roots
_npmname=roots
pkgver=1.1.1
pkgrel=2
pkgdesc="Toolbox for building simple, beautiful, and efficient products for the web"
arch=('any')
depends=('nodejs')
url="https://npmjs.org/package/roots"
license=('MIT')
provides=('nodejs-roots')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
