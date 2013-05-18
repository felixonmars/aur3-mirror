# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=slimit
provides=('slimit')
pkgver=0.8.1
pkgrel=1
pkgdesc="SlimIt - JavaScript minifier"
arch=('any')
url="http://slimit.org/"
license=('MIT')
depends=('python2' 'python2-ply>=3.4' 'python2-odict')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/s/slimit/slimit-${pkgver}.zip)
md5sums=('5f5f86e98940a1e71a6a30d501e0d733')

build() {
   cd "${srcdir}/slimit-${pkgver}"
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

