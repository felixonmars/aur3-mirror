# Maintainer:  perlawk


pkgname=cl-ncurses
pkgver=0.1.4
pkgrel=1
pkgdesc="Ncurses interface for common lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-ncurses"
license=('BSD')
depends=('common-lisp')
install=cl-ncurses.install
options=()  # TODO: do when fully supported by pacman
source=(http://common-lisp.net/project/cl-ncurses/files/cl-ncurses_latest-version.tgz)
md5sums=('60cde15b3c037f394e0c24eb55ad56f8')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname} || return 1
    install -d ${pkgdir}/usr/share/common-lisp/systems || return 1
#    install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
#    install -d ${pkgdir}/usr/share/doc/${pkgname} || return 1

    cd ${srcdir}/${pkgname}_${pkgver} || return 1

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} \
        *.lisp || return 1
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} \
        *.asd || return 1
#    install -m 644 ${srcdir}/LICENSE \
#        ${pkgdir}/usr/share/licenses/${pkgname} || return 1
#    install -m 644 doc/index.html \
#        ${pkgdir}/usr/share/doc/${pkgname} || return 1

    cd ${pkgdir}/usr/share/common-lisp/systems || return 1
    ln -s ../source/${pkgname}/${pkgname}.asd . || return 1
}

# vim:set ts=2 sw=4 et nospell:

