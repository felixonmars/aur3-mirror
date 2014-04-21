# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-argvard
_pkgname=argvard
pkgver=0.3.0
pkgrel=1
pkgdesc="Python framework for command line applications"
arch=('any')
url="https://github.com/DasIch/argvard"
license=('apache')
depends=('python2')
source=("https://github.com/DasIch/${_pkgname}/archive/${pkgver}.zip")
md5sums=('256423ff3a3298c0220fcbe31342f07d')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

