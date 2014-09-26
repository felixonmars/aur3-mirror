_npmname=protractor
_npmver=1.3.0
pkgname=nodejs-protractor # All lowercase
pkgver=1.3.0
pkgrel=1
pkgdesc="Webdriver E2E test wrapper for Angular."
arch=(any)
url="https://github.com/angular/protractor"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(cb1e5819eba757ffd22222796bb18ba4185de064)

build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
