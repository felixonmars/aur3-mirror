# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=tar-musl-static
pkgver=1.27.1
pkgrel=1
pkgdesc="Utility used to store, backup, and transport files, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/tar/tar.html"
license=('GPL3')
makedepends=('make' 'musl-static')
provides=('tar=1.27.1')
conflicts=(tar)
options=(strip !libtool staticlibs !upx !debug)
source=(http://ftp.gnu.org/gnu/tar/tar-$pkgver.tar.xz)
md5sums=('e0382a4064e09a4943f3adeff1435978')

build() {
  cd "$srcdir/tar-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -static"
  ./configure --prefix=/usr --libexecdir=/usr/lib/tar --libdir=/usr/lib/tar --without-selinux
  make
}

package() {
  cd "$srcdir/tar-$pkgver"
  make DESTDIR="$pkgdir/" install
}

