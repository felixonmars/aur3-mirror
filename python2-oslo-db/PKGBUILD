# Maintainer: Makito Nishimiya <nishimiy a ninja,co,jp>

_module="oslo.db"
pkgname="python2-oslo-db"
pkgver=1.8.0
pkgrel=1
pkgdesc="Oslo Database library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.db"
license=("Apache")
depends=(
#    "python2-testscenarios>=0.4"
#    "python2-testresources>=0.2.4"
    "python2-sqlalchemy<=0.9.99"
#    "python2-sqlalchemy-migrate>=0.9.5"
    "python2-alembic>=0.7.2"
    "python2-babel>=1.3"
    "python2-oslo-utils>=1.2.0"
    "python2-oslo-config>=1.2.0"
    "python2-oslo-i18n>=1.3.0"
    "python2-six>=1.9.0"
    "python2-iso8601>=0.1.9"
    "python2-stevedore>=1.1.0"
    "python2-pbr>=0.6"
)
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('0688ced3c34c975e2a68139e0f91601ef43c79fb73308d75674fdc40d30a2d4c')

build() {
  cd "${srcdir}/${_module}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
