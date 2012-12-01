# Contributor: Chuck Yang <Chuck dot Yang at gmail dot com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
 
pkgname=python2-cairoplot
_pkgname=cairoplot
pkgver=1.2
pkgrel=1
pkgdesc="Python API to plot graphics"
arch=(any)
url="http://rodrigoaraujo01.github.com/cairoplot/"
license=('LGPL')
depends=('python2' 'python2-cairo')
replaces=('python-cairoplot')
source=("https://github.com/rodrigoaraujo01/cairoplot/archive/$pkgver.tar.gz")
md5sums=('bf6bec90ca3b5f46be00a483b34e47e3')
 
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/trunk"
    find . -name '*.py' | xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
    python2 setup.py install --root="${pkgdir}"
}
