# Maintainer:  <clu>

pkgbase=python-vo
pkgname=('python-vo')
true && pkgname=('python2-vo' 'python3-vo')
_pkgname=vo
pkgver=0.8
pkgrel=1
pkgdesc="A library to parse, validate and generate VOTABLE XML files."
url="https://trac6.assembla.com/astrolib"
arch=('i686' 'x86_64')
license=('BSD')
#depends=('python2' 'python2-numpy' 'python-pyfits')
makedepends=('python' 'python2>=2.6' 'python-distribute' 'python2-distribute')
#conflicts=()
#replaces=()
#backup=()
source=(http://stsdas.stsci.edu/astrolib/vo-${pkgver}.tar.gz)
md5sums=('af67d56c102bfffd975c8180bb656de2')
#source=(http://stsdas.stsci.edu/astrolib/vo-${pkgver}.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
}

package_python2-vo() {
  depends=('python2>=2.6' 'python2-numpy>=1.0' 'python2-pyfits>=2.2')
  provides=("python-vo=${pkgver}")
  replaces=('python-vo')
  conflicts=('python-vo')

  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}

package_python3-vo() {
  depends=('python' 'python-numpy>=1.0' 'python-pyfits>=2.2')

  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
