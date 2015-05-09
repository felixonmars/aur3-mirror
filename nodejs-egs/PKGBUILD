# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-egs
_npmname=egs
pkgver=0.3.1
pkgrel=1
pkgdesc="Embedded GorillaScript template generator"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://ckknight.github.io/egs/"
license=('MIT')
provides=('nodejs-egs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
