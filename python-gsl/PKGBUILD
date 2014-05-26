# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: oslik@mail.ru
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
pkgname=python-gsl
pkgver=0.9.5
pkgrel=4
pkgdesc="Python interface wrapper for GNU scientific library(GSL)"
url="http://pygsl.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'python2-numpy' 'gsl')
source=(http://downloads.sourceforge.net/project/pygsl/pygsl/pygsl-$pkgver/pygsl-$pkgver.tar.gz)
md5sums=('fca5cbda1380218a28f2ebdc15a224fb')

prepare() {
  cd "$srcdir/pygsl-$pkgver"
}

build() {
  cd "$srcdir/pygsl-$pkgver"
  python2 setup.py build
}

package() {
  local pyversion
  cd "$srcdir/pygsl-$pkgver"
  python2 setup.py install --root="$pkgdir"
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*$/python2/' {} \;
}
