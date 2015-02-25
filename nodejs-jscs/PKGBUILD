pkgname=nodejs-jscs
_npmname=jscs
pkgver=1.0
pkgrel=1
pkgdesc="JavaScript Code Style checker"
arch=('any')
depends=('nodejs')
url="https://github.com/jscs-dev/node-jscs"
license=('MIT')
provides=('jscs' 'nodejs-jscs')

pkgver() {
    echo $(npm view jscs version)
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
