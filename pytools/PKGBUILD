# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pytools
pkgver=2011.3
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="http://mathema.tician.de/software/pytools"
license=('MIT/X Consortium')
depends=('python2' 'python-decorator')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/pytools/${pkgname}-${pkgver}.tar.gz)
sha1sums=('1694ed65329af710c5aee74fa11992c836778450')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 setup.py build
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
