# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python-garlicsim
pkgver=0.5.1
pkgrel=1
pkgdesc="Pythonic framework for working with simulations"
arch=('i686' 'x86_64')
url="http://garlicsim.org/"
license=('LGPL')
depends=('python2')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/g/garlicsim/garlicsim-0.5.1.tar.gz)
md5sums=('99385e8f7121ce73d492f7d41d670267')

build() {
   cd ${srcdir}/garlicsim-${pkgver}
   python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
