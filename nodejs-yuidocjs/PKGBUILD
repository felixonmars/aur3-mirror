# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-yuidocjs
_npmname=yuidocjs
pkgver=0.3.47
pkgrel=1
pkgdesc="YUI's JavaScript Documentation engine"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/yui/yuidoc"
license=('BSD')
provides=('yuidoc' 'nodejs-yuidocjs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
