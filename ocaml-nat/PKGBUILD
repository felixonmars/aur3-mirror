# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-nat
pkgver=3.12.0
pkgrel=1
pkgdesc="OCaml with native toplevel"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url="http://caml.inria.fr/"
depends=('gdbm')
makedepends=('tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
_pkgname=${pkgname/-nat/}
source=(http://caml.inria.fr/distrib/ocaml-3.12/${_pkgname}-$pkgver.tar.gz)
md5sums=('3ba7cc65123c3579f14e7c726d3ee782')
options=('!makeflags' '!emptydirs')
provides=('ocaml=3.12.0')
conflicts=('ocaml')

build()
{
  cd "$srcdir/${_pkgname}-$pkgver"

  # configure
  ./configure -prefix /usr 

  # build
  make world.opt ocamlnat || return 1

  # install
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install || return 1
  install -D -m 755 "$srcdir/${_pkgname}-$pkgver/ocamlnat" "$pkgdir/usr/bin/ocamlnat"
  install -D -m 644 "$srcdir/${_pkgname}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/ocaml/LICENSE"
}
