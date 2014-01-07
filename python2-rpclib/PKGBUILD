#Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
pkgname=python2-rpclib
_pkgname=rpclib
pkgver=2.8.0
pkgrel=1
pkgdesc='A transport and architecture agnostic rpc library that focuses on exposing public services with a well-defined API.'
arch=('any')
url='http://rpclib.io/'
license=('LGPL')
depends=('python2-pytz')
optdepends=('mod_wsgi')
source=(https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}-rc.tar.gz)
sha256sums=('846d46bc6ffff23a3c8382df45dce5ac2e7d889ce1904d2b394864d21cf329c1')

build() {
  cd $srcdir/${_pkgname}-${pkgver}-rc
  sed "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -i rpclib/test/sort_wsdl.py
  sed "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
  python2 setup.py build
}

package(){
  cd $srcdir/${_pkgname}-${pkgver}-rc
  python2 setup.py install --root=$pkgdir/
}
