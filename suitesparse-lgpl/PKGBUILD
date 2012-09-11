# Contributor: Ilya Mezhirov <mezhirov@gmail.com>

pkgname=suitesparse-lgpl
pkgver=3.6.1
pkgrel=2
pkgdesc="A collection of sparse matrix libraries (LGPL-compatible only)"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('i686' 'x86_64')
conflicts=('suitesparse' 'umfpack')
depends=()
makedepends=('gcc-fortran')
license=('LGPL')
source=(http://www.cise.ufl.edu/research/sparse/SuiteSparse/SuiteSparse-$pkgver.tar.gz UFconfig.patch Makefile.patch)
md5sums=('88a44890e8f61cdbb844a76b7259d876'
         '87b75277c4d7faf04812e1a811f24f09'
         'fe928afba56becb1f7404fcf33642d0a')


build() {
    cd "$srcdir/SuiteSparse"
    patch -p1 <"${srcdir}/UFconfig.patch" || return 1
    patch -p1 <"${srcdir}/Makefile.patch" || return 1

    LIBDIR="${pkgdir}/usr/lib"
    INCDIR="${pkgdir}/usr/include/suitesparse"
    mkdir -p "$LIBDIR" 
    mkdir -p "$INCDIR"
    export pkgdir
    make
    make install || return 1

    chmod 644 "$LIBDIR"/* "$INCDIR"/*
}
