# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-constraint
pkgver=1.1
pkgrel=5
pkgdesc='A Python module offering solvers for Constraint Solving Problems (CSPs) over finite domains in simple and pure Python'
arch=('any')
url='http://labix.org/python-constraint'
license=('GPL')
depends=('python2')
source=("http://labix.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('975e5449d6670dd19498bb9ec4856d39')

build() {
  cd ${pkgname}-${pkgver}

  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir} --optimize=1
}
