# Maintainer: RethinkDB Inc. <bugs@rethinkdb.com>
_base=rethinkdb
pkgname=python2-${_base}
pkgver=1.10.0
pkgrel=1
pkgdesc="This package provides the Python driver library for the RethinkDB database server."
arch=('any')
url="http://rethinkdb.com"
license=('UNKNOWN')
groups=()
depends=('python2' 'python2-protobuf')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/${_base}/${_base}-${pkgver}-0.tar.gz")
md5sums=('cc41946abb9c3b91d09e746ee4721984')

package() {
  cd ${_base}-${pkgver}-0

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
