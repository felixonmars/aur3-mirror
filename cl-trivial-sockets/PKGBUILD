# Maintainer: DavidK <david_king at softhome dot net>

pkgname=cl-trivial-sockets
pkgver=0.3
pkgrel=1
pkgdesc="A trivial networking library for Common Lisp"
arch=('any')
url="http://www.cliki.net/trivial-sockets"
license=('GPL')
depends=('common-lisp')
source=('http://common-lisp.net/project/usocket/releases/old/trivial-sockets.tar.gz')
md5sums=('47e1fea675beda8c333615c2de3f2285')
_clname=trivial-sockets

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems

    cd "${srcdir}"/$_clname/
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname README
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/$_clname \
        *.asd

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/$_clname/$_clname.asd .
}

# vim:set ts=2 sw=4 et nospell:
