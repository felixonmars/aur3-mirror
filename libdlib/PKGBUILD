# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=libdlib
_pkgname=dlib
pkgver=18.15
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (with pre-build library)"
arch=('i686' 'x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('glibc')
makedepends=('gcc' 'cmake')
optdepends=('cblas: for BLAS support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
conflicts=('dlib')
provides=('dlib')
options=('staticlibs')
source=(http://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        cmake)
md5sums=('55922b2138913100634c42e36730dac7'
         '87fa99ecfd83d1a384d50e8d5ee36318')
install=${pkgname}.install

build() {
    mkdir -p "${srcdir}/${_pkgname}-build"
    cd "${srcdir}/${_pkgname}-build"

    cmake "../${_pkgname}-${pkgver}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    mv ${_pkgname}/cmake ${_pkgname}/cmake.orig
    install -Dm644 ../cmake ${_pkgname}

    install -Dm755 -d "${pkgdir}/usr/include"
	cp -a ${_pkgname} "${pkgdir}/usr/include"

    cd "${srcdir}/${_pkgname}-build"
    install -Dm755 -d "${pkgdir}/usr/lib"
    install -Dm644 libdlib.a "${pkgdir}/usr/lib"
}
