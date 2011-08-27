#Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=ocaml-compiler-libs
pkgver=3.10.2
pkgrel=1
pkgdesc="Modules used internally by the Objective Caml (OCaml) compiler"
arch=('i686' 'x86_64')
url="http://caml.inria.fr/"
license=('QPL')
depends=('ocaml')
replaces=('ocaml-compiler-lib')
source=(http://caml.inria.fr/pub/distrib/ocaml-3.10/ocaml-$pkgver.tar.gz)
md5sums=('52c795592c90ecb15c2c4754f04eeff4')

build() {
  cd $startdir/src/ocaml-$pkgver
  ./configure -no-tk || return 1
  make world.opt || return 1
  mkdir -p $startdir/pkg/usr/lib/ocaml/compiler-libs || return 1
  install -m 0644 $startdir/src/ocaml-3.10.0/parsing/*.{mli,cmi,cmo,cmx,o} 	\
   $startdir/src/ocaml-3.10.0/typing/*.{mli,cmi,cmo,cmx,o} 				\
   $startdir/src/ocaml-3.10.0/utils/*.{mli,cmi,cmo,cmx,o} 				\
   $startdir/src/ocaml-3.10.0/driver/*.{mli,cmi,cmo,cmx,o} 				\
   $startdir/pkg/usr/lib/ocaml/compiler-libs
  cd $startdir/pkg/usr/lib/ocaml/compiler-libs
  ln -s . driver
  ln -s . utils
  ln -s . parsing
  ln -s . typing  
}
