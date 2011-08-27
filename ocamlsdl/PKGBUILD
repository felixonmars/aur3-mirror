# Maintainer: Alexander Bau <abau[aT]imn.htwk-leipzig.de>
pkgname=ocamlsdl
pkgver=0.8.0
pkgrel=1
pkgdesc="OCaml interface to the Simple DirectMedia Layer library"
arch=(i686)
url="http://ocamlsdl.sf.net/"
license=('LGPL')
depends=('ocaml' 'sdl' 'sdl_ttf' 'sdl_mixer' 'sdl_image' 'ocaml-findlib')
optdepends=('sdl_gfx: SDL Graphic Primitives')
source=('http://sourceforge.net/projects/ocamlsdl/files/OCamlSDL/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz/download')
md5sums=('b7ee334cf107867cc8d08cbcc319c9af')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  install -dm755 "$pkgdir/usr/lib/ocaml/site-lib"
  install -dm755 "$pkgdir/usr/lib/ocaml/site-lib/stublibs"
  make OCAMLFIND_DESTDIR="$pkgdir/usr/lib/ocaml/site-lib" \
       OCAMLFIND_LDCONF="ignore" \
       install  || return 1
}


