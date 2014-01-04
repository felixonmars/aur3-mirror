# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-bordeaux-threads
pkgver=0.8.3
pkgrel=1
pkgdesc="Virtual bivalent stream implementation for Common Lisp"
arch=('any')
url="http://common-lisp.net/project/bordeaux-threads/"
license=('BSD')
depends=('common-lisp' 'cl-alexandria')
optdepends=('cl-fiveam: For test suite')
install=cl-bordeaux-threads.install
_clname=bordeaux-threads
source=("${url}/releases/${_clname}-${pkgver}.tar.gz")
md5sums=('d188630d197711d39690cf1afd25279a')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/src
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/test
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${_clname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/src \
      src/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/test \
      test/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
      *.asd
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
      version.lisp-expr
    install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-test.asd .
}

# vim:set ts=2 sw=4 et nospell:
