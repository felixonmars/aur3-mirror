# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-pytest
pkgver=2.4.2
pkgrel=1
pkgdesc="rapid testing utils"
arch=('any')
license=('MIT')
url="http://pytest.org/"
depends=('python' 'python-py>=1.4.17')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/p/pytest/pytest-$pkgver.tar.gz)
md5sums=('9ce14429bd9fae08a3d9ae6b7046d9fc')

build() {
  cd "${srcdir}/pytest-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
