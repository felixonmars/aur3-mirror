# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nodejs8-srs
pkgver=0.2.20
pkgrel=2
pkgdesc="Bindings to libosr for handling spatial references in node"
arch=('i686' 'x86_64')
url="https://github.com/springmeyer/node-srs"
license=('BSD')
depends=('nodejs8')
makedepends=('make')
source=('http://registry.npmjs.org/srs/-/srs-0.2.20.tgz')
sha512sums=('b3d03463c99365b6b0cb5eb1cd164c95c97184be824a5ab42ced896ae796e572b122c8f65476abc621de9d90a1146437ecf989d951165866c6c8ed5af7c2bce7')

build() {
  cd "$srcdir/package"
  sed -i 's/env python/env python2/g' tools/scons/scons.py
}

package() {
  cd "$srcdir/package"
  mkdir -p "${pkgdir}/usr"
  npm install -g --prefix "$pkgdir/usr"
  install -D -m644 "${pkgdir}/usr/lib/node_modules/srs/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
