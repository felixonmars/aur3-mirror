# Contributor: Lukas Linhart <bugs@almad.net>
pkgname=python-nosejs
pkgver=0.9.4
pkgrel=1
pkgdesc="A Nose plugin for integrating JavaScript tests into a Python test suite."
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/NoseJS'
license=('MIT')
depends=('python' 'python-nose' 'rhino')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/N/NoseJS/NoseJS-$pkgver.tar.gz")
md5sums=('904fdb01eba531419e98ab32065c39c5')

build() {
  cd ${srcdir}/NoseJS-$pkgver
  python setup.py build || return 1
  python setup.py install --root=${pkgdir} || return 1
}
