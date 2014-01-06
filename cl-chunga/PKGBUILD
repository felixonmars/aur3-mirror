# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-chunga
_clname=chunga
pkgver=1.1.5
pkgrel=1
pkgdesc="Implements streams capable of chunked encoding on demand for Common Lisp"
arch=('any')
url="http://www.weitz.de/chunga/"
license=('BSD')
depends=('common-lisp' 'cl-trivial-gray-streams')
install=cl-chunga.install
options=('docs')
source=('http://weitz.de/files/chunga.tar.gz' 'LICENSE')
#The sources from that website change md5sums, more often than daily, without
#change in content. We have to trust it's not really changing.
md5sums=('SKIP' '63605eed7c939d885851f2e876ce3f14')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${_clname}-${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        "${srcdir}"/${_clname}-${pkgver}/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        "${srcdir}"/${_clname}-${pkgver}/*.asd
    install -m 644 "${srcdir}"/LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
