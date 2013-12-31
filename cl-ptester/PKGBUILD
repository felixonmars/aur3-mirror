# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-ptester
pkgver=2.1.2
pkgrel=2
pkgdesc="Portable test framework library for Common Lisp"
arch=('any')
url="http://www.cliki.net/ptester"
license=('custom')
depends=('common-lisp')
install=cl-ptester.install
source=('http://files.b9.com/ptester/ptester-2.1.2.tar.gz' 'LICENSE')
md5sums=('0bf2f88cd8696687359c898d3c01bc0f' 'faca2fa96f3df8f76cea3bff60502e4f')
_clname=ptester    # used in CL scope, not package scope

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    install -d "${pkgdir}"/usr/share/doc/${pkgname}

    cd "${srcdir}"/${_clname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.asd
    install -m 644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -m 644 tester.html "${pkgdir}"/usr/share/doc/${pkgname}/

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell: