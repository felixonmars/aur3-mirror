# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=copperhead-hg
pkgver=157.6e9f76fb79ed
pkgrel=1
pkgdesc="Provides a data-parallel subset of Python for NVidia GPU programming (CUDA)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/copperhead/"
license=('Apache 2.0')
depends=('python2-pycuda' 'python2-codepy' 'python2-decorator')
makedepends=('mercurial' 'python2-pytools' 'scons')
optdepends=('boost' 'python2-matplotlib' 'python2-scipy' 'plac')
source=($pkgname::hg+https://copperhead.googlecode.com/hg/)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}
  
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

