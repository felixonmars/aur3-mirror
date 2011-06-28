# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=libgit2
pkgver=0.13.0
pkgrel=1
pkgdesc="A linkable library for Git"
arch=('i686' 'x86_64')
url="http://libgit2.github.com/"
depends=('zlib')
makedepends=('cmake')
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://www.github.com/libgit2/libgit2/tarball/v$pkgver")
md5sums=('086e58c8f324c289eb940b2bfcc05194')

build() {
  dirname=$(tar tf "$srcdir/$pkgname-$pkgver.tar.gz" | sed 1q);

  cd "$srcdir/$dirname"

  mkdir build && cd build
  builddir=`pwd`
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  dirname=$(tar tf "$srcdir/$pkgname-$pkgver.tar.gz" | sed 1q);
  cd "$srcdir/$dirname/build"
  make DESTDIR="$pkgdir" install
}
# vim: ft=sh syn=sh
