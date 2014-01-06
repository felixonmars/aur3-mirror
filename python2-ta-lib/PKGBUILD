# Maintainer: perlawk

pkgname=python2-ta-lib
pkgver=0.4
pkgrel=1
pkgdesc='python2 wrapper of talib'
arch=('any')
url="https://github.com/mrjbq7/ta-lib"
license=('custom:public domain')
depends=('cython2' 'ta-lib')
makedepends=(git)

prepare() {
  if [ ! -e "$srcdir"/ta-lib ] ; then
    git clone https://github.com/mrjbq7/ta-lib.git
  fi
}

build() {
  cd "$srcdir/ta-lib"
  python2 setup.py build 
}

package() {
  cd "$srcdir/ta-lib"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

