# Maintainer: Roger Duran <rogerduran@gmail.com>
pkgname=python-xcffib
pkgver=0.1.9
pkgrel=0
pkgdesc="Python3 drop in replacement for xpyb, an XCB python binding"
arch=(any)
url="https://pypi.python.org/pypi/xcffib"
license=(MIT)
depends=(python python-six python-cffi)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/x/xcffib/xcffib-${pkgver}.tar.gz")
md5sums=('bf9833c670c9dd0049e63cb7d58b536f')

package () {
    cd "${srcdir}/xcffib-${pkgver}/"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
