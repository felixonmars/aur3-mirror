pkgname=duolingo-graph
pkgver=0.3.0
pkgrel=1
pkgdesc="Graphs courses on Duolingo."
arch=(any)
url="https://github.com/Undeterminant/duolingo-graph"
license=(CC0)
depends=(python python-click python-igraph python-requests)
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b1991b71b69a277d2c413de4a901b776')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}
