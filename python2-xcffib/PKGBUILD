# Maintainer: Roger Duran <rogerduran@gmail.com>
pkgname=python2-xcffib
pkgver=0.1.9
pkgrel=0
pkgdesc="A drop in replacement for xpyb, an XCB python binding"
arch=(any)
url="https://pypi.python.org/pypi/xcffib"
license=(MIT)
depends=(python2 python2-six python2-cffi)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/x/xcffib/xcffib-${pkgver}.tar.gz")
md5sums=('bf9833c670c9dd0049e63cb7d58b536f')

package () {
    cd "${srcdir}/xcffib-${pkgver}/"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
