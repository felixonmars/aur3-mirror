# Maintainer: DavidK <david_king at softhome dot net>

pkgname=cl-trivial-backtrace
pkgver=1.1.0
pkgrel=1
pkgdesc="A trivial backtrace library for Common Lisp"
arch=('any')
url="http://common-lisp.net/project/trivial-backtrace/"
license=('MIT')
depends=('common-lisp')
source=('http://common-lisp.net/project/trivial-backtrace/trivial-backtrace.tar.gz')
md5sums=('86b355fc27de8639b4047727b8bedb8d')
_clname=trivial-backtrace

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/dev
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/test
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/$_clname/
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname/dev dev/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname/test test/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname *.asd
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname *.config
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname COPYING
    install -m 644 "${srcdir}"/$_clname/COPYING \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/$_clname/$_clname.asd .
    ln -s ../source/$_clname/$_clname-test.asd .
}

# vim:set ts=2 sw=4 et nospell:
