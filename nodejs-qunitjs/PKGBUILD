# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-qunitjs
pkgver=1.14.0
pkgrel=1
pkgdesc="An easy-to-use JavaScript Unit Testing framework."
arch=('any')
url="https://qunitjs.com"
license=('MIT')
depends=('nodejs')
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir --parents "$srcdir/usr/lib/node_modules"
  npm install --global --prefix "$srcdir/usr" qunitjs@$pkgver
}

package() {
  cd "$srcdir"

  cp --recursive usr "$pkgdir"

  install -D --mode=644 usr/lib/node_modules/qunitjs/MIT-LICENSE.txt \
          "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.txt"
}
