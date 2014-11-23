# Maintainer: Abhijeet Rastogi (shadyabhi) <abhijeet.1989@gmail.com>

pkgname=pyopengl-accelerate
pkgver=3.1.0
pkgrel=1
pkgdesc="Acceleration code for PyOpenGL"
arch=('any')
url="http://pypi.python.org/pypi/PyOpenGL-accelerate"
source=("http://pypi.python.org/packages/source/P/PyOpenGL-accelerate/PyOpenGL-accelerate-${pkgver}.tar.gz")
depends=('python2' 'python2-distribute')
license=('GPL')
build() {
  cd "$srcdir/PyOpenGL-accelerate-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/PyOpenGL-accelerate-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
md5sums=('489338a4818fa63ea54ff3de1b48995c')
