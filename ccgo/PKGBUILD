# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ccgo
pkgver=0.3.6.4
pkgrel=2
pkgdesc="ccGo is a program allows you to play go with gnugo on your computer or with other players on the IGS on the internet."
url="http://ccdw.org/~cjj/prog/ccgo/"
arch=(i686 x86_64)
license=('GPL')
depends=('gtkmm>=2.4.0' 'gconfmm>=2.6.0')
source=(http://ccdw.org/~cjj/prog/ccgo/src/$pkgname-$pkgver.tar.gz)
md5sums=('34009286564d42d8518d579f6aae9de4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

