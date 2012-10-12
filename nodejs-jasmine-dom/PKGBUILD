# Author: Andrew McKenzie <andrew@mckenzie.name> (http://andrew.mckenzie.name)
# Maintainer: andrewpmckenzie <andrew@mckenzie.name>
_npmname=jasmine-dom
pkgname=nodejs-jasmine-dom # All lowercase
pkgver=0.3.3
pkgrel=1
pkgdesc="Run your jasmine html SpecRunner in node.js."
arch=(any)
url="https://github.com/andrewpmckenzie/node-jasmine-dom"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=(ad1b653b4126944330acbdb7f26a8552e7d6aae1)
build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et: