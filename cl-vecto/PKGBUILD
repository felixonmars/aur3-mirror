# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-vecto
_clname=vecto
pkgver=1.4.3
pkgrel=1
pkgdesc="a simplified interface to the powerful CL-VECTORS vector rasterization library"
arch=('i686' 'x86_64')
url="http://www.xach.com/lisp/vecto/"
license=('BSD')

depends=('common-lisp' 'cl-asdf' 'cl-vectors' 'cl-zpb-ttf' 'cl-zpng')

install=cl-vecto.install
source=('http://www.xach.com/lisp/vecto.tgz')
md5sums=('d9d8320bdbcff01fd6de4095d60fdf07')

build() {
  ### TODO: finish this. I've only filled in the versions ans URLs
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/doc/${pkgname}

    cd ${srcdir}/${_clname}-${pkgver}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/${_clname}.asd

	install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \
	  ${srcdir}/${_clname}-${pkgver}/doc/*

	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:
