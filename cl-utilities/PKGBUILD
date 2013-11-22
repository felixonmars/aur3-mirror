# Maintainer: kristof <soderstroff@gmail.com>
# Contributor:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-utilities
_clname=cl-utilities   # used in CL scope, not package scope
pkgver=1.2.4
pkgrel=2
pkgdesc="A collection of semi-standard utilities for Common Lisp."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-utilities/"
license=('BSD')
depends=('common-lisp')
provides=('cl-split-sequence')

install=cl-utilities.install
source=("http://www.common-lisp.net/project/cl-utilities/cl-utilities-latest.tar.gz")
md5sums=('c3a4ba38b627448d3ed40ce888048940')
options=(docs)


build() {

  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}/
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    ${srcdir}/${_clname}-${pkgver}/*.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    ${srcdir}/${_clname}-${pkgver}/*.asd

  install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname}/ \
    ${srcdir}/${_clname}-${pkgver}/doc/*
  
  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}
