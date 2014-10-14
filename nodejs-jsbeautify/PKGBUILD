# Maintainer: renodesper <reno.esper@gmail.com>
_npmname=js-beautify
_npmver=1.5.4
pkgname=nodejs-jsbeautify # All lowercase
pkgver=1.5.4
pkgrel=1
pkgdesc="jsbeautifier.org for node"
arch=(any)
url="http://jsbeautifier.org/"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('9fe14afa4a29a3b3cef20df0754da698')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
