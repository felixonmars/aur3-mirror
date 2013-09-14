# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname='python2-ecos-git'
pkgver=2013.09.12.a7a7eb1
pkgrel=1
pkgdesc='Embedded Conic Solver (Python interface)'
url='https://github.com/ifa-ethz/ecos'
arch=('i686 x86_64')
license=('GPL3')
depends=('python2' 'python2-cvxopt' 'python2-numpy')
makedepends=('git' 'python2-setuptools')
source=("$pkgname"::"git://github.com/ifa-ethz/ecos")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git log -1 --format="%cd.%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$pkgname/python"
  python2 setup.py build
}

package() {
  cd "$pkgname/python"
  python2 setup.py install --root=$pkgdir
}
