# Maintainer: Steven Hiscocks <hiscockssd _at_ googlemail _dot_ com>
pkgname=python2-sklearn
pkgver=0.9
pkgrel=1
pkgdesc="scikit-learn is an easy-to-use and general-purpose machine learning in Python"
arch=('any')
url="http://scikit-learn.sourceforge.net/"
license=('BSD')
depends=('python2-scipy')
makedepends=('python2-distribute')
source=("http://downloads.sourceforge.net/project/scikit-learn/scikit-learn-${pkgver}.tar.gz")
md5sums=('25491af8dde7be9138f7e1d283bb3a50')

build() {
  cd $srcdir/scikit-learn-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
