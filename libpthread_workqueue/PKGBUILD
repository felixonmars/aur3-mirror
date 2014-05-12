# Contributor: Nicolas Quiénot < niQo at aur >
# Contributor: X0rg

pkgname=libpthread_workqueue
pkgver=0.9
pkgrel=1
pkgdesc="a portable implementation of the pthread_workqueue API first introduced in Mac OS X"
url="http://sourceforge.net/projects/libpwq"
arch=('i686' 'x86_64')
license=('custom:FreeBSD')
depends=('glibc')
options=('!libtool')
source=(http://optimate.dl.sourceforge.net/project/libpwq/$pkgname-$pkgver.tar.gz)
md5sums=('57910365f4741aaac533aa4344a21497')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

  sed -n '/Copyright (c) 2010/,/ * THIS SOFTWARE,/p' ./include/pthread_workqueue.h | cut -c 3- > "LICENSE"
}

# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   make check
# }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

