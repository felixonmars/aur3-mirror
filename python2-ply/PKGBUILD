# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Marcin "avalan" Falkiewicz <avalatron@gmail.com>
# Contributor: C Anthony Risinger <anthony@xtfx.me>

pkgname='python2-ply'
pkgver=3.4
pkgrel=3
pkgdesc='Implementation of lex and yacc parsing tools for Python2.'
arch=('any')
url='http://www.dabeaz.com/ply/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://www.dabeaz.com/ply/ply-${pkgver}.tar.gz")
md5sums=('ffdc95858819347bf92d7c2acc074894')

prepare() {
  rm -fr build
  mv "ply-${pkgver}" build
}

check() {
  cd build/test
  python2 testlex.py
  python2 testyacc.py
}

package() {
  cd build
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
