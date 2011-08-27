# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname=piqi
pkgver=0.5.6
pkgrel=1
pkgdesc='A set of languages and open-source tools for working with structured data.'
arch=('i686' 'x86_64')
url='http://piqi.org/'
license=('Apache')
depends=('ocaml' 'ocaml-findlib')
source=("https://github.com/alavrik/piqi/tarball/${pkgver}")
options=('!strip' '!makeflags')
md5sums=('cd76667a4423a6034009f4d1649b665f')

build() {
  cd "$srcdir/alavrik-piqi-6dbd333"

  source setenv.sh
  export PIQI_PREFIX="$pkgdir/usr"

  make deps  || return 1
  make       || return 1
  make ocaml || return 1
}

package() {
  cd "$srcdir/alavrik-piqi-6dbd333"
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  source setenv.sh
  export PIQI_PREFIX="$pkgdir/usr"

  env DESTDIR="$pkgdir/usr" make install
  env DESTDIR="$pkgdir/usr" \
      OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
      make ocaml-install
}
