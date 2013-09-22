# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=python2-pytest-pep8
pkgver=1.0.4
pkgrel=1
pkgdesc="pytest plugin to check PEP8 requirements"
arch=('any')
license=('GPL')
url="https://bitbucket.org/hpk42/pytest-pep8/"
depends=('python2-pytest' 'python2-pytest-cache' 'pep8-python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pytest-pep8/pytest-pep8-${pkgver}.zip")
sha256sums=('f93c049db6fb30084ed3115e25fd48666ef277f35bd26966e1af72e5ec03a219')

package() {
  cd "${srcdir}/pytest-pep8-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
