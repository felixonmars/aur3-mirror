# Maintainer: TJ Vanderpoel <tj@rubyists>

pkgname=musl
pkgver=1.0.0
pkgrel=1
pkgdesc="An implementation of the C/POSIX standard library intended for use on Linux-based systems"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
makedepends=('make')
source=(http://www.musl-libc.org/releases/$pkgname-$pkgver.tar.gz)
options=(staticlibs !buildflags !strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr/musl --exec-prefix=/usr && make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -d -m0755 "$pkgdir/usr/lib/"
  mv "$pkgdir/lib/ld-musl-x86_64.so.1" "$pkgdir/usr/lib/ld-musl-x86_64.so.1"
}
md5sums=('e54664fdf211d27737e328c4462b545e')
