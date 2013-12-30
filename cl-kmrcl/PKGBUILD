# Maintainer: DavidK <david_king at softhome dot net>

pkgname=cl-kmrcl
pkgver=1.106
pkgrel=1
pkgdesc="Utility functions for Common Lisp packages"
arch=('any')
url="http://www.cliki.net/kmrcl/"
license=('LGPL2.1')
depends=('common-lisp')
install=cl-kmrcl.install
source=('http://files.b9.com/kmrcl/kmrcl-1.106.tar.gz')
md5sums=('9872c55e25f06dcde0633952d6f852da')
_clname=kmrcl

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${_clname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.asd
    install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell: