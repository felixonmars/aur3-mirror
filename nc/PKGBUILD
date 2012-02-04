# Contributor: p3nguin (Rob Dailey) [rob at virtualaddiction dot net]
# Maintainer: p3nguin (Rob Dailey) [rob at virtualaddiction dot net]
pkgname=nc
pkgver=2.0
pkgrel=1
pkgdesc="simple utility which reads and writes data across network connections using TCP or UDP"
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://sed.sf.net/grabbag/misc-paolo/$pkgname-$pkgver-alpha4.tar.gz)
md5sums=('1bd2378fed65140e89ec4e8eac069b9d')
url="http://freshmeat.net/projects/netcat/?branch_id=40599"
license="Public Domain"
conflicts=(gnu-netcat)
provides=('netcat')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  cd $pkgdir/usr/bin
  ln -s nc netcat
}

