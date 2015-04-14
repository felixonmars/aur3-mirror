# Maintainer: Charles E. Hawkins <charlesthehawk -- yahoo -- com>

pkgname=ocaml-efl
pkgver=1.13.0
pkgrel=1
pkgdesc="An OCaml interface to the Enlightenment Foundation Libraries (EFL) and Elementary."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/ocaml-efl/"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib' 'efl' 'elementary')
options=('!strip')
install=
source=(http://forge.ocamlcore.org/frs/download.php/1499/$pkgname-$pkgver.tar.gz)
md5sums=('b7e5fc04f8fa644b30032da471d557e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix /usr
  make
  make doc
}

package() {
  cd "${srcdir}/$pkgname-${pkgver}"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
## install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make DESTDIR=$pkgdir install
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
#  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
#  env OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
#    OCAMLFIND_LDCONF=ignore \
#    make install
#  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
