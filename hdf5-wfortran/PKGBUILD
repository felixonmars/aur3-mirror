# Maintainer Yngve Inntjore Levinsen <yngveDOTlevinsenATgmailDOTcom>
# Contributor: Jed Brown <jed@59A2.org>
pkgname=hdf5-wfortran
_pkgname=hdf5
_prefix=/usr
pkgver=1.8.9
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="General purpose library and file format for storing scientific data"
url="http://hdfgroup.org/HDF5"
license=("custom")
provides=(hdf5=${pkgver})
conflicts=(hdf5)
depends=('zlib' 'bash' 'gcc-libs')
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${pkgver}.tar.gz)
md5sums=('d1266bb7416ef089400a15cc7c963218')
options=("!libtool")

build() {
    [ -e build ] && rm -rf build
    mkdir -p build && cd build
    unset CFLAGS
    unset CXXFLAGS
    # There is a large amount of warnings
    # that I don't want every user to see...
    export CFLAGS="-Wno-unused-but-set-variable -Wno-format-nonliteral -Wno-unsuffixed-float-constants -Wno-sign-conversion -Wno-conversion -Wno-strict-overflow -Wno-unsafe-loop-optimizations -Wno-cast-qual -Wno-c++-compat -Wno-switch-enum -Wno-unused-macros -Wno-float-equal -Wno-double-promotion"
    ../${_pkgname}-${pkgver}/configure	\
        --prefix=${_prefix} \
        --enable-hl \
        --enable-largefile \
        --enable-production \
        --enable-fortran \
        --enable-shared \
        --enable-static \
        --with-pic \
        --docdir=${_prefix}/share/${_pkgname} \
        --with-pthread=/usr/lib
    make
}
package () {
    cd $srcdir/build
    unset CFLAGS
    unset CXXFLAGS
    make -j1 prefix=${pkgdir}${_prefix} install

    install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/COPYING \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
