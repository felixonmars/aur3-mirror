# Contributor: Skal pascal <dot> grosse <at> gmail <dot> com
# Contributor: danibsp danibsp <at> gmail <dot> com
pkgname=camlimages3
pkgver=3.0.2
pkgrel=5
pkgdesc="Objective Caml image processing library"
arch=(i686 x86_64)
url="http://gallium.inria.fr/camlimages/"
license=('GPL2')
depends=('libpng' 'libtiff' 'libxpm' 'giflib' 'freetype2' 'libjpeg')
makedepends=('ocaml' 'ocaml-findlib')
#optdepends=('lablgtk' 'lablgtk2')
source=("http://gallium.inria.fr/camlimages/camlimages-$pkgver.tar.gz"
        "http://perlcabal.org/~diakopter/ocaml/bazar-ocaml/autoconf/ocaml.m4"
        "pngread.c.patch" "pngwrite.c.patch"
        "gifread.c.patch" "gifwrite.c.patch")
md5sums=('ccb2551232df255f6306941d26d07615'
         'a575bef6f8f32475165b62b2e595747c'
         'd67c473e95cfff889d36ca9fdf58b485'
         '4124e271d42d1fd8be15f34b73ad37e0'
         '96171efd63a8e1a59c1842aae97007c1'
         'bb0cbff9c89ad4bc484b9dda3730bf9f')
noextract=()
options=(!makeflags staticlibs)

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

prepare() {
  cd "${srcdir}/camlimages-${pkgver}"

  patch -p0 < ../pngread.c.patch
  patch -p0 < ../pngwrite.c.patch
  patch -p0 < ../gifread.c.patch
  patch -p0 < ../gifwrite.c.patch

  mkdir -p $srcdir/autoconf
  ln -sf $startdir/ocaml.m4 $srcdir/autoconf/
}

build() {
  cd "${srcdir}/camlimages-${pkgver}"

  mkdir -p "$OCAMLFIND_DESTDIR"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/camlimages-${pkgver}"

  make DESTDIR="${pkgdir}" OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" install
}

# vim:set ts=2 sw=2 et:


