# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-puri
_clname=puri    # used in CL scope, not package scope
pkgver=1.5.5
pkgrel=2
pkgdesc="Portable Universal Resourse Identifier library for Common Lisp"
arch=('any')
url="http://puri.b9.com/"
license=('custom')
depends=('common-lisp')
optdepends=('cl-ptester: For test package')
install=cl-puri.install
source=('http://files.b9.com/puri/puri-1.5.5.tar.gz')
md5sums=('89b687df5aa365451f1b71fcd68d0377')

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
    install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -m 644 uri.html "${pkgdir}"/usr/share/doc/${pkgname}/

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
