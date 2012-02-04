# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=zope-exceptions
pkgver=3.5.2
pkgrel=1
pkgdesc="Zope 3 exceptions"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/zope.exceptions"
license=('ZPL')
depends=('python' 'zope-interface')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/z/zope.exceptions/zope.exceptions-$pkgver.tar.gz)
md5sums=('13172baeb3182af15149cdbf94a5380b')

build() {
  cd ${srcdir}/zope.exceptions-$pkgver
  python setup.py install --root=${pkgdir} --prefix=/usr || return 1
}
