# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=python3-opengl
pkgver=3.0.2
pkgrel=1
pkgdesc="Standard OpenGL bindings for Python"
arch=('any')
url="http://pyopengl.sourceforge.net/"
license=('BSD')
depends=('python')
source=(http://pypi.python.org/packages/source/P/PyOpenGL/PyOpenGL-$pkgver.tar.gz)
makedepends=('python-distribute')
md5sums=(77becc24ffc0a6b28030aa109ad7ff8b)

build() {
  cd "$srcdir/PyOpenGL-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyOpenGL-$pkgver"
  python setup.py install --root=$pkgdir/
}
