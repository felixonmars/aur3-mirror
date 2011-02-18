# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-zpb-ttf
_clname=zpb-ttf
pkgver=1.0
pkgrel=1
pkgdesc="a Common Lisp TrueType file parser"
arch=('i686' 'x86_64')
url="http://www.xach.com/lisp/zpb-ttf/"
license=('BSD')

depends=('common-lisp' 'cl-asdf')

install=cl-zpb-ttf.install
source=('http://www.xach.com/lisp/zpb-ttf.tgz')
md5sums=('2dd4486f4beb5f996587a1b09afd8e01')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/doc/${pkgname}
	
    cd ${srcdir}/${_clname}-${pkgver}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/${_clname}.asd

	install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \
	  ${srcdir}/${_clname}-${pkgver}/${_clname}.html
	install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \
	  ${srcdir}/${_clname}-${pkgver}/lambda.png
	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
