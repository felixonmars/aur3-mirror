# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-op
_clname=cl-op
pkgver=0.7.0
pkgrel=1
pkgdesc="Partial application library for Common Lisp"
arch=('any')
url="http://code.google.com/p/cl-op/"
license=('MIT')

depends=('common-lisp' 'cl-asdf')

install=cl-op.install
source=('http://cl-op.googlecode.com/files/cl-op-0.7.0.tar.gz')
md5sums=('0e03ae1c076ef26c5af73b8fbe560dbf')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems

    cd ${srcdir}/${_clname}-${pkgver}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/${_clname}.asd
	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}
