# Maintainer: Mathieu Clabaut
pkgname=python2-qserve
_pkgname=qserve
pkgver=0.2.8
pkgrel=1
pkgdesc="job queue server"
arch=('any')
url="https://github.com/pediapress/qserve"
license="BSD"
depends=('python2' )
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/q/$_pkgname/$_pkgname-$pkgver.zip")

build() {
  cd $srcdir/$_pkgname-$pkgver
  #patch setup.py < $startdir/setup.diff
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  # docs
}

check() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py test
}

md5sums=('34cb2e4b5e7fd11753a514d61ff402f9')
md5sums=('d481f0dad66a93d0479022fe0487e8ee')
