# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-rfc2388
_clname=rfc2388
pkgver=0.5
pkgrel=1
pkgdesc="HTTP-POSTed form data processing for Common Lisp"
arch=('any')
url="http://www.common-lisp.net/project/rfc2388/"
license=('custom')
depends=('common-lisp')
install=cl-rfc2388.install
source=('http://www.common-lisp.net/project/rfc2388/rfc2388_latest.tar.gz' 'LICENSE' 'doc.html')
md5sums=('c199e8c25679543a3464c8534c9bc696' 'ae99d531e59e1722ec50064ada9f12e3'\
         '6add57235848f9235692fe07f7875735')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    install -d "${pkgdir}"/usr/share/doc/${pkgname}

    cd "${srcdir}"/${_clname}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.asd
    install -m 644 "${srcdir}"/LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 "${srcdir}"/doc.html \
        "${pkgdir}"/usr/share/doc/${pkgname}

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
