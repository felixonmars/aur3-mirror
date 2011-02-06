# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=zope-testing
pkgver=3.8.3
pkgrel=1
pkgdesc="Zope testing framework, including the testrunner script"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/zope.testing/"
license=('ZPL')
depends=('python' 'zope-interface' 'zope-exceptions')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/z/zope.testing/zope.testing-$pkgver.tar.gz)
md5sums=('1dd78003d6914f67584725ce01c86311')

build() {
  cd ${srcdir}/zope.testing-$pkgver
  python setup.py install --root=${pkgdir} --prefix=/usr || return 1
}
