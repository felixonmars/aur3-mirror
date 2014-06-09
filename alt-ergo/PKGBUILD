# Contributor: Paolo Herms

pkgname=alt-ergo
pkgver=0.95.2
pkgrel=1
pkgdesc="An automatic theorem prover dedicated to program verification"
arch=('x86_64' 'i686')
url="http://alt-ergo.lri.fr/"
license=('custom:CeCILL-C')
depends=('glibc' 'zarith')
makedepends=('ocaml>=3.08' 'ocaml-ocamlgraph')
source=("http://alt-ergo.ocamlpro.com/http/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('ab9c160f7ecb26aa2479f9169db9b869')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
