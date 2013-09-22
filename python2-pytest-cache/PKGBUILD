# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=python2-pytest-cache
pkgver=1.0
pkgrel=1
pkgdesc="pytest plugin with mechanisms for caching across test runs"
arch=('any')
license=('GPL')
url="http://bitbucket.org/hpk42/pytest-cache/"
depends=('python2-pytest' 'python2-execnet')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pytest-cache/pytest-cache-${pkgver}.tar.gz")
sha256sums=('be7468edd4d3d83f1e844959fd6e3fd28e77a481440a7118d430130ea31b07a9')

package() {
  cd "${srcdir}/pytest-cache-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
