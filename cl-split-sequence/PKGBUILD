# Maintainer: kristof <soderstroff@gmail.com>

pkgname=cl-split-sequence
_clname=split-sequence
pkgver=1.0
pkgrel=1
pkgdesc="Sequence-splitting functions for Common Lisp, part of cl-utilities"
arch=('i686' 'x86_64')
url="http://www.cliki.net/SPLIT-SEQUENCE"
license=('Public Domain')
depends=('common-lisp')

install=cl-split-sequence.install
source=("http://common-lisp.net/~sionescu/files/${_clname}-${pkgver}.tar.gz")
md5sums=('872556e3dc0630c98c68b395cfe5ab56')

package() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems

    cd ${srcdir}/${_clname}-${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
        *.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
        *.asd

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}-${pkgver}.asd .
}

# vim:set ts=2 sw=4 et nospell:
