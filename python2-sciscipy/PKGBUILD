pkgname=python2-sciscipy
pkgver=1.0.1
pkgrel=1
pkgdesc="A Scilab API for Python"
arch=('any')
url="http://forge.scilab.org/index.php/p/sciscipy/"
license=('GPL')
depends=('python2-numpy' 'scilab')
source=("http://forge.scilab.org/index.php/p/sciscipy/downloads/get/sciscipy-${pkgver}.tar.gz"
        "fixlib.diff")
md5sums=('80fa3e4dbd85445c2535e173c24ffc77'
	 'SKIP')
makedepends=('python2-setuptools')

prepare() {
  cd "$srcdir/sciscipy-$pkgver"
  patch -p1 -i "$srcdir/fixlib.diff"
}

build() {
  cd "$srcdir/sciscipy-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/sciscipy-$pkgver"
  python2 ./setup.py install --prefix=/usr --root="$pkgdir"
}
