#Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=py-dom-xpath
pkgver=0.1
pkgrel=1
pkgdesc="py-dom-xpath is a pure Python implementation of XPath 1.0."
arch=('any')
url="http://code.google.com/p/py-dom-xpath/"
license=('MIT')
depends=('python2')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('21d0c3f204d9575c733849af349934f5')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

} 
