# Maintainer: Anton Novosyolov <anton.novosyolov@gmail.com>

pkgname=python2-konch
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI and configuration utility for the Python shell, optimized for simplicity and productivity."
arch=('i686' 'x86_64')
url="https://github.com/sloria/konch"
license=('custom')
depends=('python2')
source=(https://pypi.python.org/packages/source/k/konch/konch-${pkgver}.tar.gz)
md5sums=('522917a5ec9dbe74175c1fb76b55689b')

build() {
  cd "${srcdir}"/konch-${pkgver}
  python2 setup.py build
}

package() {
  cd "${srcdir}/konch-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mv "${pkgdir}"/usr/bin/konch{,2}
}
