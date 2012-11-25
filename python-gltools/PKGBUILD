# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=python-gltools
_pkgname=gltools
pkgver=0.1.1
pkgrel=1
pkgdesc="Library for quickly creating OpenGL based application"
url="http://github.com/tenko/gltools"
license=('GPL')
depends=('python' 'python-geotools' 'glfw3-git')
makedepends=('cython')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup_build.py build_ext
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup_build.py install --root=$pkgdir
  install -m755 -D -t "$pkgdir/usr/lib/python3.3/site-packages/" "gltools/gltools.pxd" || return 1
}

md5sums=('cee8cc9f1f1b82c7abcb71ede26348bc')
