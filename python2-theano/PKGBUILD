# Current maintainer: Santi Villalba <sdvillal@gmail.com>
# Original maintainer: Thomas Dziedzic < gostrc at gmail >
# Modified by: Cristóvão D. Sousa <crisjss@gmail.com>
# Modified by: Janis Beckert <janis.beckert at gmail.com>

pkgname=python2-theano
pkgver=0.7.0
pkgrel=2
pkgdesc='A Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
depends=('python2-numpy' 'python2-scipy' 'blas')
optdepends=('python2-pycuda: for using the gpu backend')
makedepends=('python2-distribute')
checkdepends=('python2-nose')
source=("http://pypi.python.org/packages/source/T/Theano/Theano-${pkgver}.tar.gz")
md5sums=('099a9575801b71252b5bbbc3c34ed45a')


build() {
  cd "$srcdir"
  cp -r Theano-"$pkgver" Theano2-"$pkgver"
}

check() {

  cd Theano-${pkgver}
  # -----------
  # The test suite will fail as theano devs have some "KnownFailureTest" tests in place
  # -----------
  # THEANO_FLAGS='device=cpu' nosetests2
}

package_python2-theano() {
  cd "$srcdir/Theano2-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  find "$pkgdir" -name '*.py' -print0 | xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
           -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-theano/LICENSE"

  # Avoid nameclashes with python-theano
  cd "$pkgdir/usr/bin"
  for i in *; do
      mv "$i" "${i/#theano/theano2}"
  done
}
