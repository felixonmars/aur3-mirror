pkgname=osynctool
pkgver=0.39
pkgrel=1
pkgdesc="CLI interface to OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync=0.39')
makedepends=('cmake')
options=('!libtool')
source=("http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('2fdf7ef8b23c0f948b7bd250da16aa0f')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  install -D -m644 "$pkgdir/usr/etc/bash_completion.d/osynctool.sh"\
                   "$pkgdir/etc/bash_completion.d/osynctool"
  rm -rf "$pkgdir/usr/etc/"
}