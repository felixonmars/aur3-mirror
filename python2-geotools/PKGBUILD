# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=python2-geotools
_pkgname=geotools
pkgver=0.1.0
pkgrel=1
pkgdesc="A small geometry library"
url="http://github.com/tenko/geotools"
license=('GPL')
depends=('python2')
makedepends=('cython2')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup_build.py build_ext
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup_build.py install --root=$pkgdir
  install -m755 -D -t "$pkgdir/usr/lib/python2.7/site-packages/" "geotools/geotools.pxd" || return 1
}

md5sums=('b8a2b3e01918aafde0f56769cf1961e9')