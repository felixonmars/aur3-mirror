# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-karma-jasmine
pkgver=0.2.2
pkgrel=1
pkgdesc="A Karma plugin - adapter for Jasmine testing framework."
arch=('any')
url="https://karma-runner.github.io"
license=('MIT')
depends=('nodejs' 'nodejs-karma>=0.9')
makedepends=('make')
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir --parents "$srcdir/usr/lib/node_modules"
  npm install --global --prefix "$srcdir/usr" karma-jasmine@$pkgver
}

package() {
  cd "$srcdir"

  cp --recursive usr "$pkgdir"
  rm --recursive "$pkgdir/usr/lib/node_modules/karma"

  install -D --mode=644 usr/lib/node_modules/karma-jasmine/LICENSE \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
