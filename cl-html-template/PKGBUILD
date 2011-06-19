# Contributor: James Feng Cao <jamesfengcao@yahoo.com>

pkgname=cl-html-template
pkgver=0.9.1
pkgrel=4
pkgdesc="html generator from template for Common Lisp"
arch=('i686' 'x86_64')
url="http://www.weitz.de/cl-html-template/"
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

clpkgname=html-template
source=('http://weitz.de/files/html-template.tar.gz')
md5sums=('3ea05cb9d473d16616521a3087831f16')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${clpkgname}
    install -d ${pkgdir}/usr/share/common-lisp/systems

    cd ${srcdir}/${clpkgname}-${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${clpkgname} \
        ${srcdir}/${clpkgname}-${pkgver}/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${clpkgname} \
        ${srcdir}/${clpkgname}-${pkgver}/*.asd

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${clpkgname}/${clpkgname}.asd .
}