# Maintainer: Nicolas Barbey <nicolas.a.barbey@ŋmail.com>
pkgname=scikits-optimization
pkgver=0.3
pkgrel=1
pkgdesc="A python module for numerical optimization"
arch=('any')
url="http://scikits.appspot.com/optimization"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'scikits-base')
makedepends=('python2-distribute' 'gcc')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/s/scikits.optimization/scikits.optimization-0.3.tar.gz")
md5sums=('89c79dd8837a93002eb21f4d9753dbbb')

build() {
  cd "$srcdir/scikits.optimization-${pkgver}"

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
  #rm "$pkgdir/`python2 -c 'from distutils.sysconfig import get_python_lib; \
    #print get_python_lib()'`/scikits/__init__.py"
}

