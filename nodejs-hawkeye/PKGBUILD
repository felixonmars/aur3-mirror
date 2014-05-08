# Author: Bernardo Kuri <hawkeye@bkuri.com> (http://bkuri.com/)
# Maintainer: bkuri <npm@bkuri.com>
_npmname=hawkeye
_npmver=0.2.4
pkgname=nodejs-hawkeye # All lowercase
pkgver=0.2.4
pkgrel=1
pkgdesc="Monitors files for changes and fires commands straight at them when they do."
arch=(any)
url="https://github.com/bkuri/hawkeye"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(ed09046d916d33451abb90a60a181b0cc66e236f)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
