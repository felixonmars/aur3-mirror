# Maintainer: Adrian Sampson <adrian@radbox.org>

python=python2
name=munkres

pkgname=$python-$name
pkgver=1.0.5.4
pkgrel=1
pkgdesc="munkres algorithm for the assignment problem"
depends=('python2')
makedepends=('python2-distribute')
arch=('any')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)
md5sums=(cb9d114fb523428bab4742e88bc83696)
url="http://bmc.github.com/munkres/"
license="BSD"

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build || return 1
  $python setup.py install --root=$pkgdir
}
