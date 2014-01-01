# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-base64
pkgver=3.3.3
pkgrel=4
pkgdesc="Base64 encoding and decoding library for Common Lisp"
arch=('any')
url="http://www.cliki.net/cl-base64"
license=('custom')
depends=('common-lisp')
optdepends=('cl-ptester: For test suite'
            'cl-kmrcl: For test suite')
install=cl-base64.install
source=('http://files.b9.com/cl-base64/cl-base64-latest.tar.gz')
md5sums=('ddea99fdeae11781434cd569a88e4150')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${pkgname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${pkgname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        *.asd
    install -m 644 -T COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${pkgname}/${pkgname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
