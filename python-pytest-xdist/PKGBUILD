# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pytest-xdist
pkgver=1.8
pkgrel=2    # NOTE
pkgdesc="py.test xdist plugin for distributed testing and loop-on-failing modes"
arch=('any')
license=('GPL')
url="http://pytest.org/latest/xdist.html"
depends=('python' 'python-py' 'python-pytest' 'python-execnet')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/p/pytest-xdist/pytest-xdist-$pkgver.zip)
md5sums=('9c0b8efe9d43b460f8cf049fa46ce14d')

build() {
  cd "${srcdir}/pytest-xdist-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
