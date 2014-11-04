# Maintainer: Frank Neuhaus <fneuhaus@uni-koblenz.de>

pkgname=python2-theano-git
conflicts=('python2-theano')
provides=('python2-theano')
pkgver=20141103
pkgrel=3
pkgdesc='A Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently.'
arch=('any')
url='https://github.com/Theano/Theano'
license=('BSD')
depends=('python2-numpy' 'python2-scipy' 'blas')
optdepends=('python2-pycuda: for using the gpu backend')
makedepends=('python2-distribute')
checkdepends=('python2-nose')
source=("git://github.com/Theano/Theano.git")
md5sums=('SKIP')

build() {
  cd Theano

  find \
    -name '*\.py' \
    -exec sed -e 's_#!/usr/bin/env python_&2_' -e 's_#!/usr/bin/python_&2_' -i {} \;

  python2 setup.py build
}

package() {
  cd Theano

  python2 setup.py install --root="$pkgdir" --optimize=1

chmod o+r -R ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/python2-theano
  install -m644 LICENSE.txt \
    ${pkgdir}/usr/share/licenses/python2-theano
}

