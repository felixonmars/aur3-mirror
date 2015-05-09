# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-ripple-lib
_npmname=ripple-lib
pkgver=0.7.29
pkgrel=1
pkgdesc="Ripple JavaScript client library"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://npmjs.org/package/ripple-lib"
license=('MIT')
provides=('nodejs-ripple-lib')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
