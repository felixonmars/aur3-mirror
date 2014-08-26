# Maintainer: TJ Vanderpoel <tj@rubyists>

pkgname=musl
pkgver=1.0.4
pkgrel=1
pkgdesc="An implementation of the C/POSIX standard library intended for use on Linux-based systems"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
makedepends=('make')
provides=('musl')
conflicts=('musl-mainline')
source=(CHANGELOG http://www.musl-libc.org/releases/$pkgname-$pkgver.tar.gz)
options=(staticlibs !buildflags !strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ "$CC" != "clang" ];then
    _my_flags="-fno-toplevel-reorder -fno-stack-protector"
  fi
  CFLAGS="${CFLAGS} $_my_flags"  ./configure --prefix=/usr/musl --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -d -m0755 "$pkgdir/usr/lib/"
  mv "$pkgdir/lib/"ld-musl*.so* "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir"/usr/share/doc/musl
  cp COPYRIGHT README "$pkgdir"/usr/share/doc/musl/
  cp "$srcdir"/CHANGELOG "$pkgdir"/usr/share/doc/musl/CHANGELOG.archlinux
}
md5sums=('92a0f8b66b3592d914213596ec363216'
         'f502c98800dfe02d063ca66a1aea5a3e')
