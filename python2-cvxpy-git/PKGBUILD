# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname='python2-cvxpy-git'
pkgver=2013.09.05.7f7c6f0
pkgrel=1
pkgdesc='Modeling convex optimization problems in Python'
url='https://github.com/cvxgrp/cvxpy'
arch=('any')
license=('GPL3')
depends=('python2' 'python2-cvxopt' 'python2-numpy' 'python2-scipy' 'python2-ecos-git')
makedepends=('git' 'python2-setuptools')
source=("$pkgname"::"git://github.com/cvxgrp/cvxpy.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git log -1 --format="%cd.%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir
}
