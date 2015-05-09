# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-gorillascript
_npmname=gorillascript
pkgver=0.9.10
pkgrel=1
pkgdesc="GorillaScript is a compile-to-JavaScript language designed to empower the user while attempting to prevent some common errors"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="http://ckknight.github.io/gorillascript/"
license=('MIT')
provides=('nodejs-gorillascript')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
