# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-migrate-havana"
pkgver=0.9
pkgrel=1
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/sqlalchemy-migrate"
license=("MIT")
source=("https://pypi.python.org/packages/source/s/sqlalchemy-migrate/sqlalchemy-migrate-${pkgver}.tar.gz")
md5sums=("cc058f41f0d4f7c65b6b76bb03fe7c8d")
pkgdesc="Openstacks database schema migration for SQLAlchemy"
depends=('python2'
         'python2-sqlalchemy-havana'
         'python2-decorator'
         'python2-six'
         'python2-tempita')
conflicts=("python2-migrate")

build() {
  cd "${srcdir}/sqlalchemy-migrate-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/sqlalchemy-migrate-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
