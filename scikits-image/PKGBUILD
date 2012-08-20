# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scikits-image
pkgver=0.6.1
pkgrel=1
pkgdesc="Image processing routines for SciPy"
arch=('i686' 'x86_64')
url="http://scikits-image.org/"
license=('BSD')
depends=('python2-scipy')
makedepends=('python2-distribute' 'cython2>=0.15')
optdepends=('python2-qt: Qt implementation of imshow and scivy'
            'pygtk: GTK implementation of imshow'
            'freeimage: to read more image file formats'
            'gdal: to read data via GDAL library'
            'python2-pyfits: to read data from FITS files'
            'python2-matplotlib: to display and save images using matplotlib'
            'python-imaging: to read more image file formats')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/s/scikits-image/scikits-image-${pkgver}.tar.gz")
md5sums=('8254225078f5ed8d04744ad26e56c513')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

