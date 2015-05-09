# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-btc
_npmname=btc
pkgver=0.0.4
pkgrel=1
pkgdesc="Command-line Bitcoin price board for geeks"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/turingou/btc"
license=('MIT')
provides=('btc' 'nodejs-btc')
conflicts=('btc')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
