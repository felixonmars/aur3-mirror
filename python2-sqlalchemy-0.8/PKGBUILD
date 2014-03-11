# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-sqlalchemy-0.8"
pkgver=0.7.9
pkgrel=1
pkgdesc="Database abstraction library"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/SQLAlchemy"
license=("Apache")

depends=(
  "python2"
  "python2-setuptools"
  "python2-nose"
)

conflicts=("python2-sqlalchemy")
source=("http://archive.ubuntu.com/ubuntu/pool/main/s/sqlalchemy/sqlalchemy_${pkgver}.orig.tar.gz")
md5sums=("a0b58defc5ad0c7e1baeb932f62d08dd")

package() {
  cd "${srcdir}/SQLAlchemy-${pkgver}/"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}