# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-zpng
_clname=zpng
pkgver=1.2.1
pkgrel=1
pkgdesc="a Common Lisp library for creating PNG files"
arch=('i686' 'x86_64')
url="http://www.xach.com/lisp/zpng/"
license=('BSD')

depends=('common-lisp' 'cl-asdf' 'cl-salza2')

install=cl-zpng.install
source=('http://www.xach.com/lisp/zpng.tgz')
md5sums=('91ad8d4909684e9b0d5f45f064575373')

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
