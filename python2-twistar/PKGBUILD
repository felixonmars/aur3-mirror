# Maintainer: trillanewhero <mikhail.svetkin@gmail.com>

pkgname=python2-twistar
_pyname=twistar
_gitname=twistar
pkgver=1.2
pkgrel=1
pkgdesc="Twistar is an object-relational mapper (ORM) for Python that uses the Twisted library to provide asynchronous DB interaction"
arch=('any')
url="https://github.com/bmuller/twistar"
license=('BSD')
depends=('mysql-python' 'python2-psycopg2' 'python2-pysqlite')
makedepends=('git' )

source=('git+https://github.com/bmuller/twistar.git')
provides=('twistar')
conflicts=('twistar')
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python2.7 setup.py install --root="${pkgdir}/" --optimize=1
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's/-/_/g;s/v//'
}

# vim:set ts=2 sw=2 et:
