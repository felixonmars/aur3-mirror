# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-karma-coverage
pkgver=0.2.4
pkgrel=1
pkgdesc="A Karma plugin. Generate code coverage."
arch=('any')
url="https://github.com/karma-runner/karma-coverage"
license=('MIT')
depends=('nodejs-karma>=0.9')
makedepends=('make')
options=(!emptydirs)
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir --parents "$srcdir/usr/lib/node_modules"
  npm install --global --prefix "$srcdir/usr" karma-coverage@$pkgver
}

package() {
  cd "$srcdir"

  cp --recursive usr "$pkgdir"
  rm --recursive "$pkgdir/usr/lib/node_modules/karma"

  install -D --mode=644 usr/lib/node_modules/karma-coverage/LICENSE \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
