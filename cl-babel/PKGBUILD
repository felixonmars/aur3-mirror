# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-babel
_clname=babel    # used in CL scope, not package scope
pkgver=0.3.0
pkgrel=1
pkgdesc="A charset encoding/decoding library, not unlike GNU libiconv, written in Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/babel/"
license=('BSD')

# TODO: replace this segment with 'common-lisp' when all provide it.
# TODO: bash is needed to generate some files in tests?
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf' 'cl-trivial-features' 'cl-trivial-gray-streams')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf' 'cl-trivial-features' 'cl-trivial-gray-streams')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'cl-trivial-features' 'cl-trivial-gray-streams')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf' 'cl-trivial-features' 'cl-trivial-gray-streams')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf' 'cl-trivial-features' 'cl-trivial-gray-streams')
else
    depends=('sbcl' 'cl-trivial-features' 'cl-trivial-gray-streams')
fi

install=cl-babel.install
source=('http://common-lisp.net/project/babel/releases/babel_0.3.0.tar.gz')
md5sums=('ba6540828fbe1d494fb0d6cab14a5de3')


build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${srcdir}/${_clname}_${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src \
        ${srcdir}/${_clname}_${pkgver}/src/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests \
        ${srcdir}/${_clname}_${pkgver}/tests/*
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
        ${srcdir}/${_clname}_${pkgver}/*.asd

    install -m 644 ${srcdir}/${_clname}_${pkgver}/COPYRIGHT \
        ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-streams.asd .
    ln -s ../source/${_clname}/${_clname}-tests.asd .
}

# vim:set ts=2 sw=4 et nospell:
