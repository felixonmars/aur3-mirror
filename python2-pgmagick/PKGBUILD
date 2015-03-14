# Maintainer: Zhehao Mao <zhehao.mao@gmail.com>
pkgname=python2-pgmagick
pkgver=0.5.9
pkgrel=1
pkgdesc='Python bindings for GraphicsMagick'
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/pgmagick/'
license=('MIT')
depends=('graphicsmagick' 'boost-libs')
makedepends=('python2-distribute' 'boost')
source=("http://pypi.python.org/packages/source/p/pgmagick/pgmagick-$pkgver.tar.gz")
md5sums=('a7d0fb047d9cc91b6c478cbb1f5eaf3c')

build() {
  cd "${srcdir}/pgmagick-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pgmagick-${pkgver}"
  python2 setup.py install --root=$pkgdir
}
