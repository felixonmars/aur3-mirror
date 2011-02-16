# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-cells
_clname=cells
pkgver=2.0
pkgrel=1
pkgdesc="an extension to CLOS that allows you to create classes, the instances of which have slots whose values are determined by a formula"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cells/"
license=('MIT')

depends=('common-lisp' 'cl-asdf')

install=cl-cells.install
source=('http://www.common-lisp.net/project/cells/asdf-install/cells_2.0.tar.gz')
md5sums=('76211d301a8f37fcc7899e57c26fad8b')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems

    cd ${srcdir}/${_clname}_${pkgver}

	cp -r * ${pkgdir}/usr/share/common-lisp/source/${_clname}
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type f -print0 | xargs -0 chmod 644 || return 1
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type d -print0 | xargs -0 chmod 755 || return 1
	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-test.asd .
}

# vim:set ts=2 sw=4 et nospell:
