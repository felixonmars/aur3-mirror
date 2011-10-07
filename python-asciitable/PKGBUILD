# Maintainer: Hubert Siejkowski <hubert.siejkowski@gmail.com>
# Contributor: <clu>

pkgbase=python-asciitable
pkgname=('python-asciitable')
true && pkgname=('python2-asciitable' 'python3-asciitable')
pkgver=0.8.0
pkgrel=1
pkgdesc="An extensible ASCII table reader and writer"
arch=('any')
url="http://cxc.harvard.edu/contrib/asciitable/"
license=('BSD')
makedepends=('python' 'python2' 'python-distribute' 'python2-distribute')
source=(http://pypi.python.org/packages/source/a/asciitable/asciitable-${pkgver}.tar.gz)
md5sums=('913dac05fbf69ae76504f955b77659e5')


build() {
  cd $srcdir/asciitable-$pkgver
}

package_python2-asciitable() {
  depends=('python2')
  provides=("python-asciitable=${pkgver}")
  replaces=('python-asciitable')
  conflicts=('python-asciitable')
  
  cd $srcdir/asciitable-${pkgver}
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
}

package_python3-asciitable() {
  depends=('python')
  
  cd $srcdir/asciitable-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
}
