pkgname=mingw32-libssh2-static
pkgver=1.1
pkgrel=2
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts"
url="http://www.libssh2.org/"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('openssl' 'zlib')
source=("http://downloads.sourceforge.net/libssh2/libssh2-$pkgver.tar.gz")
md5sums=('f8a3eb9bb814e0a5a2bb76a5423f5129')

build() {
  cd $srcdir/libssh2-$pkgver
  ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --with-libz-prefix=/usr/i486-mingw32/lib --with-libssl-prefix=/usr/i486-mingw32/lib --enable-static --disable-shared
  make CFLAGS='-W -Wall -DLIBSSH2_API=' LIBS='-lgdi32 -lws2_32' || return 1
  make DESTDIR=${pkgdir} install || return 1
}
