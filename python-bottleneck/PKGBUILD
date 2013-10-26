# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python-bottleneck
_pkgname=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast NumPy array functions written in Cython"
arch=('i686' 'x86_64')
url="http://berkeleyanalytics.com/bottleneck/"
license=('BSD')
depends=('python-numpy')
optdepends=('python-nose')
makedepends=('cython')
options=('!emptydirs')
source=("https://github.com/kwgoodman/bottleneck/archive/v$pkgver.tar.gz")
md5sums=('5e0c372027834713914766cf3a933590')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's/python/python2/g' Makefile
  make clean pyx build
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

