# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=python2-occmodel
_pkgname=occmodel
pkgver=0.1.0
pkgrel=1
pkgdesc="Simplified python wrapper for OpenCASCADE"
url="http://github.com/tenko/occmodel"
license=('GPL')
depends=('python2' 'python2-geotools' 'python2-gltools' 'oce')
makedepends=('cython2')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/o/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  make pylib
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup_build.py install --root=$pkgdir
}

md5sums=('7408db1ac0a985c28b189f2bed8f7d6d')
