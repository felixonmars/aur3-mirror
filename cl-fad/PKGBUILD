# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-fad
pkgver=0.7.2
pkgrel=1
pkgdesc="Peter Seilbel's pathname unification layer for Common Lisp"
arch=('any')
url="http://www.weitz.de/cl-fad/"
license=('BSD')
depends=('common-lisp' 'cl-bordeaux-threads' 'cl-alexandria')
install=cl-fad.install
options=('docs')
source=('http://weitz.de/files/cl-fad.tar.gz')
#The sources from that website change md5sums, more often than daily, without
#change in content. We have to trust it's not really changing.
md5sums=('SKIP')

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${pkgname} || return 1
    install -d "${pkgdir}"/usr/share/common-lisp/systems || return 1
    install -d "${pkgdir}"/usr/share/licenses/${pkgname} || return 1
    install -d "${pkgdir}"/usr/share/doc/${pkgname} || return 1

    cd "${srcdir}"/${pkgname}-${pkgver} || return 1

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        *.lisp || return 1
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${pkgname} \
        *.asd || return 1
    install -m 644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE || return 1
    install -m 644 doc/index.html \
        "${pkgdir}"/usr/share/doc/${pkgname} || return 1

    cd "${pkgdir}"/usr/share/common-lisp/systems || return 1
    ln -s ../source/${pkgname}/${pkgname}.asd . || return 1
}

# vim:set ts=2 sw=4 et nospell:

