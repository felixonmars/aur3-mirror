# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=python-occmodel
_pkgname=occmodel
pkgver=0.1.0
pkgrel=1
pkgdesc="Simplified python wrapper for OpenCASCADE"
url="http://github.com/tenko/occmodel"
license=('GPL')
depends=('python' 'python-geotools' 'python-gltools' 'oce')
makedepends=('cython')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/o/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  make pylib PYTHON=python PYVER=3.3
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup_build.py install --root=$pkgdir
}

md5sums=('7408db1ac0a985c28b189f2bed8f7d6d')
