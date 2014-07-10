# Maintainer: TJ Vanderpoel <tj@rubyists>

pkgname=musl-mainline
pkgver=1.1.3
pkgrel=1
pkgdesc="An implementation of the C/POSIX standard library intended for use on Linux-based systems, edge version"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
makedepends=('make')
source=(CHANGELOG http://www.musl-libc.org/releases/musl-$pkgver.tar.gz)
provides=('musl')
conflicts=('musl')
options=(staticlibs !buildflags !strip)

build() {
  cd "$srcdir/musl-$pkgver"

  if [ "$CC" != "clang" ];then
    _my_flags="-fno-toplevel-reorder -fno-stack-protector"
  fi
  CFLAGS="${CFLAGS} $_my_flags"  ./configure --prefix=/usr/musl --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/musl-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -d -m0755 "$pkgdir/usr/lib/"
  mv "$pkgdir/lib/"ld-musl*.so* "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir"/usr/share/doc/musl
  cp COPYRIGHT README "$pkgdir"/usr/share/doc/musl/
  cp "$srcdir"/CHANGELOG "$pkgdir"/usr/share/doc/musl/CHANGELOG.archlinux
}
md5sums=('865845d22c4fee9817d3eec383da667e'
         '1628bd4c86b14b90447e1dcf8421aed7')
