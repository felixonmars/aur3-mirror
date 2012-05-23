# Maintainer: Gerardo Marset <gammer1994@gmail.com>

pkgname=svgplotlib
pkgver=0.2
pkgrel=1
pkgdesc="Python 2 package to create SVG charts and graphs."
arch=('i686' 'x86_64')
url="http://code.google.com/p/svgplotlib/"
license=('BSD')
depends=('python2-pyparsing')
makedepends=('cython2' 'freetype2')
source=(http://svgplotlib.googlecode.com/files/svgplotlib-$pkgver.tar.gz)
md5sums=('e38474e2e624d29975aa2b736a1047a5')

build() {
  cd $pkgname-$pkgver
  ln -s /usr/include/freetype2/ svgplotlib/include
  sed '/^ *buffer\.shape / s|&self|self|' -i svgplotlib/freetype.pyx
  sed '/^ *buffer\.strides / s|&self|self|' -i svgplotlib/freetype.pyx
  python2 setup.py install --root $pkgdir
  unlink svgplotlib/include
}

# vim: set sts=2 sw=2 et:
