# Maintainer: Maxime Arthaud <maxime at arthaud.me>

pkgname=ocaml-ikos
pkgver=1.0
pkgrel=1
pkgdesc='OCaml API for IKOS (Inference Kernel for Open Static Analyzers)'
arch=('any')
url='https://bitbucket.org/lememta/ikos-api'
makedepends=('git')
depends=('ocaml' 'boost' 'boost-libs' 'gmp')
license=('MIT')
options=('staticlibs')
source=('git+https://bitbucket.org/lememta/ikos-api.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/ikos-api"
  ./waf configure --no-python --no-lustrec
  ./waf build
}

package() {
  cd "$srcdir/ikos-api"
  ./waf install --prefix="/usr" --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
