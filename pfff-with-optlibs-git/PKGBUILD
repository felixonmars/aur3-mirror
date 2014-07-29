# Maintainer: David Stelter <david.stelter@gmail.com>
# Contributor: Francisco Lopes <chico.lopes@gmail.com>

pkgname='pfff-with-optlibs-git'
pkgver=v0.27.3.r217.gabf63e5
pkgrel=1
pkgdesc='tools and APIs for code analysis, visualization and transformation'
arch=('x86_64')
url='https://github.com/facebook/pfff'
license=('LGPL2.1')
optdepends=('gtk2: required by codegraph and codemap')
makedepends=('git' 'ocaml' 'ocaml-findlib')
source=('git+https://github.com/facebook/pfff.git')
options=(!makeflags staticlibs) # parallel build fails, need *.a files
md5sums=('SKIP')
conflicts=(pfff-git)
provides=(pfff)

_gitname=pfff

pkgver() {
    cd $srcdir/$_gitname
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_gitname
    ./configure --prefix=/usr
    make depend
    make
    make opt
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR=$pkgdir install
    mkdir -p ${pkgdir}/lib/ocaml # ocamlfind won't do this itself...
    make OCAMLFIND_LDCONF=${pkgdir}/tmp/ld.conf OCAMLFIND_DESTDIR=${pkgdir}/lib/ocaml install-findlib
}
