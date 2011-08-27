# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-xmls
_simplepkgname=xmls
pkgver=1.2
pkgrel=1
pkgdesc="Simple XML parser for Common Lisp, mapping from XML to S-expressions and back"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/xmls/"
license=('BSD')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf')
else
    depends=('sbcl')
fi

install=cl-xmls.install
source=('http://common-lisp.net/project/xmls/xmls-1.2.tar.gz')
md5sums=('f67e68b05a75f47474868f92cd4d2b0a')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_simplepkgname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/licenses/${_simplepkgname}
    install -d ${pkgdir}/usr/share/doc/${pkgname}

    cd ${srcdir}/${_simplepkgname}-${pkgver} || return 1

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_simplepkgname} \
        ${srcdir}/${_simplepkgname}-${pkgver}/*.lisp || return 1
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_simplepkgname} \
        ${srcdir}/${_simplepkgname}-${pkgver}/*.asd || return 1
    install -m 644 -t ${pkgdir}/usr/share/licenses/${_simplepkgname} \
        ${srcdir}/${_simplepkgname}-${pkgver}/COPYING || return 1
    install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \
        ${srcdir}/${_simplepkgname}-${pkgver}/README.html || return 1

    cd ${pkgdir}/usr/share/common-lisp/systems || return 1
    ln -s ../source/${_simplepkgname}/${_simplepkgname}.asd . || return 1
}

# vim:set ts=2 sw=4 et nospell:
