# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: substack <mail@substack.net>
_npmname=watchify
_npmver=0.10.2
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="watch mode for browserify builds"
arch=(any)
url="https://github.com/substack/watchify"
license=('MIT')
depends=('nodejs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
