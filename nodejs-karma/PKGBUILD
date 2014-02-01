# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-karma
pkgver=0.10.9
pkgrel=1
pkgdesc="Spectacular Test Runner for JavaScript."
arch=('i686' 'x86_64')
url="https://github.com/karma-runner/karma"
license=('MIT')
depends=('fontconfig' 'nodejs')
makedepends=('make')
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/usr/lib/node_modules"
  npm install -g --prefix "$srcdir/usr" karma@$pkgver
}

package() {
  cd "$srcdir"

  cp -R usr "$pkgdir"
  install -D -m644 usr/lib/node_modules/karma/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
