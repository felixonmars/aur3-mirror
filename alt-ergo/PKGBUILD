
# Contributor: Paolo Herms

pkgname=alt-ergo
pkgver=0.95.1
pkgrel=1
pkgdesc="An automatic theorem prover dedicated to program verification"
arch=(x86_64 i686)
url="http://alt-ergo.lri.fr/"
license=('custom:CeCILL-C')
depends=('glibc')
makedepends=('ocaml>=3.08' 'ocaml-ocamlgraph')
source=(http://alt-ergo.lri.fr/http/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p "$pkgdir"/usr/bin
  make prefix="$pkgdir"/usr install 
  install -m644 -D CeCILL-C "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


md5sums=('c0f1cbfdae04f1c37853ed5fd10154ec')
