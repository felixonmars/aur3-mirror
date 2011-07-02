# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=cout
pkgver=1.0.5
pkgrel=1
pkgdesc="Highlights the output of different programs with color according to defined patterns."
arch=('any')
url="http://code.google.com/p/$pkgname/"
license=('GPL')
depends=('python2')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('5a632ea23702a88cd8300f350479644a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix makefile
  sed -i "s|'\(C.*E\)'|\1|" Makefile

  # python2 fix
  sed -i "s|\(python\).*|\12|" $pkgname

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
