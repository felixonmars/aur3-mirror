# Maintainer: Cheng Sun <[a single underscore] at chengsun.uk>

pkgname=python2-pysubnettree
pkgver=0.23
pkgrel=1
pkgdesc='Provides a Python data structure SubnetTree that maps subnets given in CIDR notation to Python objects'
arch=('any')
url="http://www.bro.org/sphinx/components/pysubnettree/README.html"
license=('BSD')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/pysubnettree/pysubnettree-$pkgver.tar.gz)
md5sums=('e987ff9b6700a65423827450eb1ca128')

build() {
  cd ${srcdir}/pysubnettree-${pkgver}
}

package() {
  cd ${srcdir}/pysubnettree-${pkgver}

  # build
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
