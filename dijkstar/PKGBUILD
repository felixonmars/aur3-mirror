# Maintainer: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=dijkstar
pkgver=1.0
pkgrel=3
pkgdesc="An implementation of Dijkstra's single-source shortest-paths algorithm written in Python."
arch=('any')
url='http://pypi.python.org/pypi/Dijkstar/'
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/D/Dijkstar/Dijkstar-$pkgver.tar.gz")
md5sums=('ef260e27ffd8a17c4b43a5f77b68a655')

build() {
  cd "$srcdir/Dijkstar-$pkgver"
  python2 setup.py install --root="$pkgdir" || return 1
}

