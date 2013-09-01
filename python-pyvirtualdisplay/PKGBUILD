# Maintainer: Kevin Thomas <hamgom95 at gmail dot com>
pkgname=python-pyvirtualdisplay
pkgver=0.1.2
pkgrel=1
pkgdesc="python wrapper for Xvfb, Xephyr and Xvnc"
arch=(any)
url="https://pypi.python.org/pypi/PyVirtualDisplay"
license=('BSD')
depends=('python>=3.2' 'python-setuptools')
source=(https://pypi.python.org/packages/source/P/PyVirtualDisplay/PyVirtualDisplay-${pkgver}.tar.gz)
md5sums=('82be357c693a4350be4bd7054c1a3c73')

build() {
   cd "${srcdir}/PyVirtualDisplay-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
