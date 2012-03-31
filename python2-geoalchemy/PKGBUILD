# Maintainer: Steven Hiscocks <steven _at_ hiscocks _dot_ me _dot_ uk>
pkgname=python2-geoalchemy
pkgver=0.7.1
pkgrel=1
pkgdesc="GeoAlchemy provides extensions to SQLAlchemy to work with spatial databases."
arch=('any')
url="http://www.geoalchemy.org/"
license=('MIT')
depends=('python2-sqlalchemy')
optdepends=('python2-psycopg2: postgis support')
makedepends=('python2-distribute')
source=("https://github.com/geoalchemy/geoalchemy/tarball/$pkgver")
md5sums=('9f9caf0419f2f95b03576bf992cedee3')

build() {
  cd $srcdir/geoalchemy-geoalchemy-*
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
