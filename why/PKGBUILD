# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why
pkgver=2.34
pkgrel=1
pkgdesc="software verification platform"
arch=(x86_64 i686)
license=('LGPL')
url="http://why.lri.fr/"
depends=('gtk2')
optdepends=('frama-c' 'simplify-bin' 'yices-bin' 'z3-bin' 'alt-ergo')
makedepends=('ocaml' 'lablgtk2>=2.14' 'ocaml-ocamlgraph')
source=(http://why.lri.fr/download/$pkgname-$pkgver.tar.gz)
md5sums=('e622157c9b5cfc4e454a2a98bcc5828c')


build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  [[ -e /usr/share/frama-c/Makefile.dynamic ]] && {
     mkdir -p "$pkgdir"/usr/share/frama-c/ "$pkgdir"/usr/lib/frama-c/plugins/
     cp -v /usr/share/frama-c/Makefile.* "$pkgdir"/usr/share/frama-c
   }
  [[ -e /usr/share/frama-c/Makefile.dynamic ]] || echo "no way"
  make DESTDIR="$pkgdir" FRAMAC_SHARE="$pkgdir"/usr/share/frama-c COQLIB="$pkgdir"/usr/lib/coq install
  rm -f "$pkgdir"/usr/share/frama-c/Makefile.*
}
