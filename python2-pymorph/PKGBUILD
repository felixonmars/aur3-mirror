# Contributor: CHEN Xing <cxcxcxcx@gmail.com>
# Last changed: 2012-02-24

pkgname=python2-pymorph
pkgver=0.96
pkgrel=1
pkgdesc="Python Image Morphology Toolbox"
license=("BSD")
url="http://luispedro.org/software/pymorph"
depends=('python2' 'python2-scipy')

source=(http://pypi.python.org/packages/source/p/pymorph/pymorph-$pkgver.tar.gz)

arch=('any')

build() {
  cd $startdir/src/pymorph-$pkgver
  # patch -p1 < $startdir/patch || exit 1
  /usr/bin/python2 setup.py build || return 1
  /usr/bin/python2 setup.py install --root=$startdir/pkg
}
md5sums=('ed3b9b30b8b0286996e3d26eea8b4bbf')
