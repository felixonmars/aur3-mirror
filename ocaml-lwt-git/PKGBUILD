# Maintainer: Ben Darwin <bcdarwin@gmail.com>
# Based on the ocaml-lwt package

pkgname=ocaml-lwt-git
_pkgname=lwt-git
pkgver=2.4.5.20a893d
pkgrel=2
pkgdesc="A library for cooperative threads in OCaml"
arch=('i686' 'x86_64')
url="http://ocsigen.org/lwt/"
license=('LGPL')
depends=('ocaml-compiler-libs' 'ocaml-react' 'ocaml-text'
         'ocaml-ssl' 'libev' 'glib2')
makedepends=('ocaml-findlib' 'ocaml-oasis' 'git')
provides=('ocaml-lwt')
options=(!strip staticlibs)
source=("$pkgname"::'git://github.com/ocsigen/lwt.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  RELEASE=$(echo -n $(grep -o '[0-9]*\.[0-9]*\.[0-9]*' CHANGES | head -n1))
  REVISION=$(git rev-parse --short HEAD)
  echo "$RELEASE.$REVISION"
}

build() {
  cd "$srcdir/${pkgname}"

  echo '<src/top/*.*>: use_compiler_libs' >> _tags # ??
  # What requires what?
  # --enable-glib      glibc
  # --enable-react     ocaml-react
  # --enable-ssl       ocaml-ssl
  # --enable-text      ocaml-text
  # --enable-toplevel  ocaml-compiler-libs

  ./configure --enable-react \
              --enable-glib \
              --enable-ssl \
              --enable-text \
              --enable-toplevel \
              --disable-debug \
              --prefix /usr \
              --destdir $pkgdir
  make || return 1
}

package() {
  cd "$srcdir/${pkgname}"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"

  mkdir -p "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
