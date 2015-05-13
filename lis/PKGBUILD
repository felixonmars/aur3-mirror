# Maintainer: D. Naumov <aur[at]naumov[dot]de>
pkgname=lis
pkgver=1.5.54
pkgrel=1
pkgdesc="Library of Iterative Solvers for linear systems."
url="http://www.ssisc.org/lis"
optdepends=('openmpi: MPI support')
makedepends=()
arch=('i686' 'x86_64')
conflicts=('lis')
provides=('lis')
source=(${url}/dl/${pkgname}-${pkgver}.tar.gz)
license=('custom')
options=('!strip')
md5sums=('f1348745455952e449f339d55e3c3c16')

build() {

    cd "${srcdir}/${pkgname}-${pkgver}"

    msg 'Configure lis'
    ./configure \
        --prefix=/usr \
        --enable-fma \
        --enable-shared \
        --enable-static \
        --disable-dependency-tracking \
        #--enable-debug

        #--enable-mpi \
        #--enable-omp \

    msg 'Build lis'
    make
}

check() {
    msg 'Check lis'
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {

   cd "${srcdir}/${pkgname}-${pkgver}"
   make install DESTDIR="${pkgdir}"
   rm -rf ${pkgdir}/usr/share/examples
   rm -f ${pkgdir}/usr/bin/spmvtest{1,2,2b,3,3b,4,5}
   rm -f ${pkgdir}/usr/bin/hpcg_spmvtest

   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
