# $Id$
# Maintainer: Nicolas Hureau <kalenz@lse.epita.fr>

pkgname=ocaml-patched-binutils
pkgver=3.12.0
pkgrel=2
pkgdesc="A functional language with OO extensions - patched to work with binutils >= 2.21"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url="http://caml.inria.fr/"
depends=('gdbm')
makedepends=('tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
provides=('ocaml')
conflicts=('ocaml')
source=(http://caml.inria.fr/distrib/ocaml-3.12/ocaml-$pkgver.tar.gz
        '0007-Fix-ocamlopt-w.r.t.-binutils-2.21.patch')
md5sums=('3ba7cc65123c3579f14e7c726d3ee782'
         '8c664a0a346424ea2ec6fc6f713170c6')
options=('!makeflags' '!emptydirs')

build() {
  cd $srcdir/ocaml-$pkgver
  patch -Np1 -i ${srcdir}/0007-Fix-ocamlopt-w.r.t.-binutils-2.21.patch
  ./configure -prefix /usr
  make world.opt
  make PREFIX=$pkgdir/usr MANDIR=$pkgdir/usr/share/man install

  # Save >10MB with this one, makepkg only strips debug symbols.
  find ${startdir}/pkg/usr/lib -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # install license
  install -D -m 644 $startdir/src/ocaml-$pkgver/LICENSE $startdir/pkg/usr/share/licenses/ocaml/LICENSE
}
