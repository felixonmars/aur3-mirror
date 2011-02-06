
# Contributor: Paolo Herms

pkgname=alt-ergo
pkgver=0.92.2
pkgrel=2
pkgdesc="An automatic theorem prover dedicated to program verification"
arch=(x86_64 i686)
url="http://alt-ergo.lri.fr/"
license=('custom:CeCILL-C')
depends=('glibc')
makedepends=('ocaml>=3.08' 'ocaml-ocamlgraph')
source=(http://alt-ergo.lri.fr/http/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p "$pkgdir"/usr/bin
  make MANDIR="$pkgdir"/usr/share/man LIBDIR="$pkgdir"/usr/lib BINDIR="$pkgdir"/usr/bin install 
  install -m644 -D CeCILL-C "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('c5a8b65487a2a39230da01293d59d392')
md5sums=('0b0255eb21d9d46fb9b0b61b1831565b')
