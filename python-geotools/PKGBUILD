# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=python-geotools
_pkgname=geotools
pkgver=0.1.0
pkgrel=1
pkgdesc="A small geometry library"
url="http://github.com/tenko/geotools"
license=('GPL')
depends=('python')
makedepends=('cython')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i 's/__div__/__truediv__/g' geotools/@src/Point.pxi
  sed -i 's/__idiv__/__itruediv__/g' geotools/@src/Point.pxi
  sed -i 's/__div__/__truediv__/g' geotools/@src/Transform.pxi
  sed -i 's/__idiv__/__itruediv__/g' geotools/@src/Transform.pxi
  python setup_build.py build_ext
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup_build.py install --root=$pkgdir
  install -m755 -D -t "$pkgdir/usr/lib/python3.3/site-packages/" "geotools/geotools.pxd" || return 1
}

md5sums=('b8a2b3e01918aafde0f56769cf1961e9')