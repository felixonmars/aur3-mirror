# Contributor: Marco Elver <marco.elver AT gmail.com>

pkgname=django-sphinx
pkgver=2.2.4
pkgrel=1
pkgdesc="A transparent layer for full-text search using Sphinx and Django."
arch=('any')
url='http://pypi.python.org/pypi/django-sphinx'
license=('BSD')
depends=('python2' 'django')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-$pkgver.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
md5sums=('90a5a28abeb88a7883b644c0cdf49eb2')
