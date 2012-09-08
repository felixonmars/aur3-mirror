#Maintainer: Axilleas Pipinellis <axilleas archlinux.gr>
#Contributor: David Campbell <davekong@archlinux.us>
#Contributor: Cilyan Olowen <gaknar@gmail.com>
#Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>
pkgname=pythoni2-webtest
pkgver=1.4.0
pkgrel=1
pkgdesc="Helper to test WSGI applications"
arch=('any')
url="http://pythonpaste.org/webtest/"
license=('MIT')
depends=('python2' 'python2-webob')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/W/WebTest/WebTest-${pkgver}.tar.gz)
md5sums=('399636c164110079127a5d8e21c9d79e')

build() {
  cd ${srcdir}/WebTest-${pkgver}
  python2 setup.py install --root=${pkgdir} -O1
  install -Dm644 docs/license.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
