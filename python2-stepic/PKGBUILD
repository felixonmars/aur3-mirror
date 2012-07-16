# Maintainer: Robson Cardoso dos Santos <cardoso.rcs at gmail dot com>

pkgname=python2-stepic
pkgver=0.3
pkgrel=1
pkgdesc="Python Steganography in Images"
arch=('any')
url="http://domnit.org/stepic/doc/"
depends=('python2')
license=('GPL')
source=(http://domnit.org/stepic/dist/stepic-${pkgver}.tar.gz)
md5sums=('2b5d0f9752563f2a787621f88fdd8063')


package() {
  cd "$srcdir/stepic-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=0
}
