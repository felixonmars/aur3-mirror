# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=zookeeper-c-client
pkgver=3.4.5
pkgrel=1
pkgdesc="A C-based client for connecting to Apache ZooKeeper servers"
arch=('i686' 'x86_64')
url="https://zookeeper.apache.org/"
license=('APACHE')
depends=('glibc')
makedepends=('gcc' 'make')
options=('!libtool')
changelog=$pkgname.changelog
source=(http://apache.mirror.iweb.ca/zookeeper/zookeeper-$pkgver/zookeeper-$pkgver.tar.gz)
md5sums=('f64fef86c0bf2e5e0484d19425b22dcb')

build() {
  cd "$srcdir/zookeeper-$pkgver/src/c"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/zookeeper-$pkgver/src/c"

  make DESTDIR="$pkgdir/" install
}
