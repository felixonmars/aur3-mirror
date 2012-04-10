# Maintainer: Erdbeerkaese <erdbeerkaese underscore arch at yahoo dot de>

pkgname=cpunit
pkgver=0.95
pkgrel=1
pkgdesc="C++ unit test framework"
arch=('i686' 'x86_64')
url="http://cpunit.sourceforge.net/"
license=('BSD')
depends=('sh' 'gcc-libs')
makedepends=('bash' 'binutils' 'gcc')
source=(http://sourceforge.net/projects/cpunit/files/CPUnit_${pkgver}.tar.gz)
sha1sums=('06a0a52bf2e72407c7e476c1b5589a4fcbb2fc36')

build() {
    cd "${srcdir}"
    ./build_cpunit

    cd test
    ./build_tests
    ./tester
}

package() {
    cd "${srcdir}"
    install -D -m644 lib/libCPUnit.a "${pkgdir}/usr/lib/libCPUnit.a"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"

    install -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/"
    for f in doc/*
    do
        install -m644 $f "${pkgdir}/usr/share/doc/${pkgname}/"
    done

    install -d "${pkgdir}/usr/include/${pkgname}"
    for f in src/*
    do
        install -m644 $f "${pkgdir}/usr/include/${pkgname}/"
    done
}
# vim:set ts=4 sw=4 et:
