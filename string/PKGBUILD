# Maintainer: Petrenko Alexey <alexey-p@uralweb.ru>
pkgname=string
pkgver=1.0.0
pkgrel=1
pkgdesc="A non-GUI version of guitar tuner Gstring"
arch=('i686' 'x86_64')
url="http://www.employees.org/~stannous/gstring.html"
license=('GPL')
depends=('fftw2')
source=("http://www.employees.org/~stannous/gstring-$pkgver.tar.gz")
md5sums=('b881fa40c56eae8e308f1f26ba44851e')

build() {
  cd "$srcdir/gstring-$pkgver"

  make string || return 1;
}

package() {
  cd "$srcdir/gstring-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  install -m 555 -D string "$pkgdir/usr/bin/"
}
