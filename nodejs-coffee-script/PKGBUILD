# Author: Jeremy Ashkenas
# Maintainer: michaelficarra <npm@michael.ficarra.me>
_npmname=coffee-script
_npmver=1.8.0
pkgname=nodejs-coffee-script # All lowercase
pkgver=1.8.0
pkgrel=1
pkgdesc="Unfancy JavaScript"
arch=(any)
url="http://coffeescript.org"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('9c9f1d2b4a52a000ded15b659791703648263c1d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
