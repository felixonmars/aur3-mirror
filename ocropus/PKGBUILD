# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ocropus
pkgver=0.7
pkgrel=1
pkgdesc="State-of-the-art document analysis and OCR system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
depends=('python-imaging' 'python2-matplotlib' 'python2-scipy' 'python2-pytables')
makedepends=('mercurial' 'curl')
source=("ocropus::hg+https://code.google.com/p/ocropus#tag=ocropus-$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/ocropus"

  cd "$srcdir"/$pkgname/ocropy

  # make sure python2 is always used
  find . -type f -name "*.py" -exec sed -i 's|^#!.*python$|&2|' '{}' ';'
  sed -i 's|^#!.*python$|&2|' ocropus-*
  # FIX LOADING OF MODELS
  sed -i 's|/usr/local|/usr|' ocrolib/common.py
  sed -i 's|/usr/local|/usr|' ocrolib/default.py

  # download data (large !)
  python2 setup.py download_models
  # build
  python2 setup.py build
}

#check() {
#  cd "$srcdir"/$pkgname/ocropy
#
#  export PATH="`pwd`:$PATH"
#  ./run-test
#}

package() {
  cd "$srcdir"/$pkgname/ocropy

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
