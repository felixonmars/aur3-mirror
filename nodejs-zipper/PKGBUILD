# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=nodejs-zipper
pkgver=0.3.0
pkgrel=1
pkgdesc="Insanely simple zipfile creator for node.js"
arch=('i686' 'x86_64')
url="https://github.com/rubenv/zipper"
license=('BSD')
depends=('libzip' 'nodejs')
makedepends=('make')
install=$pkgname.install
changelog=$pkgname.changelog

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/usr/lib/node_modules"
  npm install -g --prefix "$srcdir/usr" zipper@$pkgver

  # Clean up
  cd "$srcdir/usr/lib/node_modules/zipper/build"
  rm -r *Makefile *.gypi *.mk Release/{.deps,*.target,*.lock}
}

package() {
  cd "$srcdir"

  cp -R usr "$pkgdir"
  install -D -m644 usr/lib/node_modules/zipper/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
