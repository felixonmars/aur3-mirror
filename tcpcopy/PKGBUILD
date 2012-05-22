# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=tcpcopy
pkgver=0.4.0
pkgrel=1
pkgdesc="a request replication tool and is mainly for testing tasks using netlink and raw sockets"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tcpcopy/"
license=('BSD')
groups=()
depends=('iptables')
makedepends=()
source=(http://tcpcopy.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('3f1b776a5f818f1d7e7c9b90078d1e34')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
