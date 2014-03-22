# Maintainer: Christer Edwards <christer.edwards@gmail.com>
pkgname=python2-tinkerer
pkgver=1.3.0
pkgrel=1
pkgdesc="Tinkerer is a blogging engine/static website generator powered by Sphinx."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/Tinkerer/"
license=('BSD')
depends=('python2' 'python2-argparse' 'python2-jinja' 'python2-sphinx')
source=(http://pypi.python.org/packages/source/T/Tinkerer/Tinkerer-${pkgver}.zip)
md5sums=('4397de973e753ebf747d010ddac366c8')

build() {
  cd ${srcdir}/Tinkerer-$pkgver
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
