# Maintainer: Guillaume Brunerie <guillaume.brunerie@[ens.fr|gmail.com]>
pkgname=smocaml
pkgver=1.6.1
pkgrel=1
pkgdesc="Server for Stepmania Online"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/smocaml/"
license=('MIT')
depends=('glibc')
makedepends=('ocaml')
install=smocaml.install
source=(http://downloads.sourceforge.net/$pkgname/SMOCaml-$pkgver.tar.gz)
md5sums=(3d9a5ebf3cf52417af3677a0ce93e08d)

build() {
  cd "$srcdir/SMOCaml"

  sed -i s#\./etc#/etc/smocaml.d# src/main.ml
  make
}

package() {
  cd "$srcdir/SMOCaml"

  install -D smocaml $pkgdir/usr/bin/smocaml
  mkdir -p $pkgdir/etc/smocaml.d
  install -Dm644 etc/* $pkgdir/etc/smocaml.d/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/smocaml/COPYING
}

# vim:set ts=2 sw=2 et:
