# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

pkgname=python2-feedgenerator
_pkgname=feedgenerator
pkgver=1.7
pkgrel=2
pkgdesc="Standalone version of django.utils.feedgenerator (python2)."
url="https://pypi.python.org/pypi/feedgenerator"
arch=('any')
license=('GPL')
depends=('python2' 'python2-pytz' 'python2-six' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('92978492871342ad64e8ae0ccfcf200c')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}" || return 1
}
