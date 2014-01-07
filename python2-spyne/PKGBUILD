#Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
pkgname=python2-spyne
_pkgname=spyne
pkgver=2.10.9
pkgrel=2
pkgdesc='A transport and architecture agnostic rpc library that focuses on exposing public services with a well-defined API.'
arch=('any')
url='http://spyne.io/'
license=('LGPL')
depends=('python2-pytz')
optdepends=('mod_wsgi')
source=(https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3ef65f50a11762db02fd823b2cbd2de056bff5302d59a03875f07ed295fe992a')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  sed "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -i spyne/test/sort_wsdl.py
  sed "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
  python2 setup.py build
}

package(){
  cd $srcdir/${_pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir/
  sed "s|#![ ]*/usr/sbin/python2$|#!/usr/bin/python2|" \
      -i ${pkgdir}/usr/bin/sort_wsdl
}
