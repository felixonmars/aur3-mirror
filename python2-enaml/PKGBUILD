# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-enaml
pkgver=0.9.8
pkgrel=1
pkgdesc="Enaml is not a Markup Language"
arch=('i686' 'x86_64')
url="https://github.com/nucleic/enaml"
license=('BSD')
depends=('python2-pyqt4' 'python2-kiwisolver' 'python2-ply' 'python2-atom')
makedepends=('python2-setuptools')
options=(!emptydirs)

source=("https://github.com/nucleic/enaml/archive/${pkgver}.tar.gz")
md5sums=('4f35c9eaee96ed2b7e556922e90a7632')

build() {
  cd "$srcdir"/enaml-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/enaml-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

