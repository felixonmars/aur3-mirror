# Maintainer: David McInnis <davidm at eagles dot ewu dot edu>

_gitname=pywt
pkgname=python-pywt-git-dev
pkgver=496fab3
pkgrel=6
pkgdesc="wavelet transform module, development version"
url="https://github.com/rgommers/${_gitname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython' 'python-sphinx')
checkdepends=('flake8' 'python-nose' 'cython' 'python-numpy')
source=("git+https://github.com/rgommers/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git log -1 --format="%h" --date=short
}

build() {
  cd $srcdir/$_gitname
  python setup.py build
  make -C doc html
}

check() {
  cd $srcdir/$_gitname
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.4:$PYTHONPATH"
  python runtests.py
}

package () {
  pkgdesc+=" (Python3.x)"

  cd $srcdir/$_gitname
  python setup.py install --root=${pkgdir} --optimize=1
  
  install -d $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/*.html $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/*.js $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/dev $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/ref $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/regression $pkgdir/usr/share/doc/$pkgname/html
  cp -rf doc/build/html/_static $pkgdir/usr/share/doc/$pkgname/html
  install -D COPYING.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}