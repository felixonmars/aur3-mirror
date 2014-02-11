# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-bottleneck
_pkgname=${pkgname#python2-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Fast NumPy array functions written in Cython"
arch=('i686' 'x86_64')
url="http://berkeleyanalytics.com/bottleneck/"
license=('BSD')
depends=('python2-numpy')
optdepends=('python2-nose')
makedepends=('cython2')
options=('!emptydirs')
source=("https://github.com/kwgoodman/bottleneck/archive/v$pkgver.tar.gz"
         python2.patch)
md5sums=('824dd093794dd3f467ab17f27ef20306'
         '8eec121e4bb9f277ca53bfe72811ccbb')

prepare() {
  cd $_pkgname-$pkgver
  make clean
  patch -p0 < ../python2.patch
}

build() {
  cd $_pkgname-$pkgver
  make pyx build
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

