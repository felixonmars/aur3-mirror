# Maintainer: spider-mario <spidermario@free.fr>
pkgname=libcrtxy
pkgver=0.0.4
pkgrel=2
pkgdesc="Vector graphics library written atop libSDL"
arch=('i686' 'x86_64')
url="http://libcrtxy.sourceforge.net/"
license=('LGPL')
groups=('devel')
depends=('sdl' 'sdl_image')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('697d4ba345798b4e90cd819422422278')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed --expression='s/-Wall/-Wall -fPIC/' --in-place Makefile
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr \
       DESTDIR="$pkgdir" \
       LIBDIR="$pkgdir/usr/lib" \
       INCDIR="$pkgdir/usr/include" \
       BINDIR="$pkgdir/usr/bin" \
       DOCDIR="$pkgdir/usr/share/doc/$pkgname" \
       MANDIR="$pkgdir/usr/share/man" \
       install

  rm "$pkgdir/usr/lib/libcrtxy.so.0" "$pkgdir/usr/lib/libcrtxy.so.0.0"
  ln -s "/usr/lib/libcrtxy.so.0.0.4" "$pkgdir/usr/lib/libcrtxy.so.0"
  ln -s "/usr/lib/libcrtxy.so.0.0.4" "$pkgdir/usr/lib/libcrtxy.so.0.0"
}

# vim:set ts=2 sw=2 et:
