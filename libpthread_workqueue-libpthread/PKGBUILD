# Maintainer: X0rg

_realname=libpthread_workqueue
pkgname=$_realname-libpthread
pkgver=0.9
pkgrel=1
pkgdesc="Portable implementation of the pthread_workqueue API (first introduced in Mac OS X) linked with libpthread"
url="http://sourceforge.net/projects/libpwq"
arch=('i686' 'x86_64')
license=('custom:FreeBSD')
depends=('glibc')
conflicts=('libpthread_workqueue' 'libpthread_workqueue-svn')
options=('!libtool')
source=("http://optimate.dl.sourceforge.net/project/libpwq/$_realname-$pkgver.tar.gz"
	'CMakeLists.txt')
md5sums=('57910365f4741aaac533aa4344a21497'
         'e95a9aeb1f7d70143923ac425983f7f2')

prepare() {
  msg2 "Move 'CMakeLists.txt' in $srcdir/$_realname-$pkgver directory..."
  mv -v "$srcdir/CMakeLists.txt" "$srcdir/$_realname-$pkgver"

  msg2 "Make 'build' directory..."
  mkdir -pv "$srcdir/$_realname-$pkgver/build"
}

build() {
  cd "$srcdir/$_realname-$pkgver/build"
  msg2 "Run 'cmake'..."
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr

  msg2 "Run 'make'..."
  make

  msg2 "Extract license..."
  sed -n '/Copyright (c) 2010/,/ * THIS SOFTWARE,/p' ./include/pthread_workqueue.h | cut -c 3- > "$srcdir/LICENSE"
}

# check() {
#   cd "$srcdir/$_realname-$pkgver/build"
#   make check
# }

package() {
  cd "$srcdir/$_realname-$pkgver/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
