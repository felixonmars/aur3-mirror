# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-karma-qunit
pkgver=0.1.1
pkgrel=1
pkgdesc="A Karma plugin. Adapter for QUnit testing framework."
arch=('any')
url="https://karma-runner.github.io"
license=('MIT')
depends=('nodejs-karma>=0.9' 'nodejs-qunitjs')
makedepends=('make')
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir --parents "$srcdir/usr/lib/node_modules"
  npm install --global --prefix "$srcdir/usr" karma-qunit@$pkgver
}

package() {
  cd "$srcdir"

  local modulesdir="$pkgdir/usr/lib/node_modules"

  cp --recursive usr "$pkgdir"
  rm --recursive "$modulesdir/karma" "$modulesdir/qunitjs"

  install -D --mode=644 usr/lib/node_modules/karma-qunit/LICENSE \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
