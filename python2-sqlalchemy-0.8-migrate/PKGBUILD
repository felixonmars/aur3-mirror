# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-sqlalchemy-0.8-migrate"
pkgver=0.7.2
pkgrel=1
pkgdesc="Database schema migration for SQLAlchemy"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/sqlalchemy-migrate"
license=("Apache")

depends=(
  "python2"
  "python2-sqlalchemy-0.8"
  "python2-decorator"
  "python2-six"
  "python2-tempita"
)

conflicts=("python2-migrate")
source=("http://archive.ubuntu.com/ubuntu/pool/main/m/migrate/migrate_${pkgver}.orig.tar.gz")
md5sums=("10382fda16f056491e671b5307dd6713")

package() {
  cd "${srcdir}/sqlalchemy-migrate-${pkgver}/"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}