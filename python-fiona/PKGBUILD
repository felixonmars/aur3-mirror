# $Id$
# Maintainer: Brett L Kleinschmidt <blk@blk.me>
# Contributor: Brett L Kleinschmidt <blk@blk.me>

pkgbase=python-fiona
pkgname=('python-fiona' 'python2-fiona')
pkgver=1.1.6
pkgrel=2
pkgdesc="Uncomplicated Python interfaces to OGR"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/Fiona"
license=('BSD')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/F/Fiona/Fiona-${pkgver}.tar.gz)
md5sums=('4db4fb720977b1a974be4899705b43d2')

prepare() {
  cp -a "Fiona-$pkgver"{,-py2}
}

build() {
  cd "Fiona-$pkgver"
  python setup.py build

  cd "../Fiona-$pkgver-py2"
  python2 setup.py build
}

package_python-fiona() {
  depends=('python>=3.3' 'gdal>=1.8')

  cd "Fiona-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}

package_python2-fiona() {
  depends=('python2>=2.6' 'gdal>=1.8')

  cd "Fiona-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
