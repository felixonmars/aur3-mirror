# Maintainer: David McInnis <davidm at eagles dot ewu dot edu>

pkgname=python-imutils
pkgver=0.2.1
pkgrel=2
pkgdesc="image processing functions such as translation, rotation, resizing, skeletonization, sorting contours & detecting edges"
url="https://github.com/jrosebr1/imutils"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')

source=(https://pypi.python.org/packages/source/i/imutils/imutils-$pkgver.tar.gz
        LICENSE.txt)
sha256sums=('ba1406206babd7f11bee3850da74bd509c89b8e5918b056e5345964271c01cc8'
            '441cc75f5bb645a2a1b37af2903994260c8573cd9c8f5de2c3018e25af0fc89a')


package () {
  pkgdesc+=" (Python3.x)"
  depends=('python')

  cd $srcdir/imutils-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

  install -D $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
}
