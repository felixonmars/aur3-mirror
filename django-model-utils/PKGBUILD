# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Florian Richter <mail@f1ori.de>

pkgname="django-model-utils"
pkgdesc="Django model mixins and utilities."
pkgver="2.0.3"
pkgrel="1"
arch=("any")
depends=("python")
makedepends=("setuptools")
license=("BSD")
url="https://github.com/carljm/django-model-utils"
source=("http://pypi.python.org/packages/source/d/django-model-utils/django-model-utils-${pkgver}.tar.gz")
sha1sums=('2305ae71092bda90b27a6c963f6c3c47e7bc96d8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  /usr/bin/python3 setup.py install --root="${pkgdir}/" --optimize=1
}
