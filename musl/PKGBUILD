# Maintainer: TJ Vanderpoel <tj@rubyists>

pkgname=musl
pkgver=0.9.14
pkgrel=1
pkgdesc="An implementation of the C/POSIX standard library intended for use on Linux-based systems"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
makedepends=('make')
source=(http://www.musl-libc.org/releases/$pkgname-$pkgver.tar.gz)
options=(!buildflags !strip)
md5sums=('bfb685695aa942e64c63170589e575b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr/musl --exec-prefix=/usr --syslibdir=/usr/lib && make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
