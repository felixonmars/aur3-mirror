# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-karma-cli
pkgver=0.0.4
pkgrel=1
pkgdesc="The Karma command line interface."
arch=('any')
url="https://karma-runner.github.io"
license=('MIT')
depends=('nodejs')
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/usr/lib/node_modules"
  npm install --global --prefix "$srcdir/usr" karma-cli@$pkgver
}

package() {
  cd "$srcdir"

  cp -R usr "$pkgdir"
  install -D -m644 usr/lib/node_modules/karma-cli/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
