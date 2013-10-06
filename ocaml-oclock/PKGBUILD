# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='oclock'
pkgname="ocaml-${srcname}"
pkgver=0.3
pkgrel=1
pkgdesc='POSIX monotonic clock for OCaml'
arch=('i686' 'x86_64')
url=https://github.com/polazarus/oclock
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/polazarus/oclock.git#tag=v$pkgver"
        https://raw.github.com/xapi-project/xenserver-core/master/SOURCES/oclock-1-cc-headers
        https://raw.github.com/xapi-project/xenserver-core/master/SOURCES/oclock-2-destdir)

prepare(){
    cd $pkgname
    patch -Np1 -i $srcdir/oclock-1-cc-headers
    patch -Np1 -i $srcdir/oclock-2-destdir
}


build() {
    cd $pkgname

    make CFLAGS='-fPIC -I /usr/lib/ocaml/'
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"

    cd $pkgname
  
  export OCAMLFIND_LDCONF=ignore
  make DESTDIR=$pkgdir/usr/lib/ocaml install

}
md5sums=('SKIP'
         'be3b07d32679a21f38d79638d3cbbbfd'
         '76cdbe9a7c797190441b07340b86e704')
