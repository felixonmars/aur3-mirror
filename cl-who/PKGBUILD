# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-who
pkgver=1.1.3
pkgrel=1
pkgdesc="With-HTML-Output macros for Common Lisp"
arch=('any')
url="http://www.weitz.de/cl-who/"
license=('BSD')
depends=('common-lisp')
optdepends=('cl-flexi-streams: for the test suite')
install=cl-who.install
source=('http://weitz.de/files/cl-who.tar.gz' 'LICENSE')
#The sources from that website change md5sums, more often than daily, without
#change in content. We have to trust it's not really changing.
md5sums=('SKIP'
         '63605eed7c939d885851f2e876ce3f14')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${pkgname}
    install -d "${pkgdir}"/usr/share/common-lisp/source/${pkgname}/test
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${pkgname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        "${srcdir}"/${pkgname}-${pkgver}/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        "${srcdir}"/${pkgname}-${pkgver}/*.asd
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname}/test \
        "${srcdir}"/${pkgname}-${pkgver}/test/*
    install -m 644 "${srcdir}"/LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${pkgname}/${pkgname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
