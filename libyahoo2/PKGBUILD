#Maintainer: Mamut Ghiunhan <venerix at gmail dot com>
pkgname='libyahoo2'
pkgver='1.0.1'
pkgrel='1'
pkgdesc="libyahoo2 is a C library interface to the new Yahoo! Messenger protocol. It supports major features of the protocol."
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('')
url=('http://libyahoo2.sourceforge.net')
source=('http://sourceforge.net/projects/libyahoo2/files/libyahoo2/1.0.1/libyahoo2-1.0.1.tar.bz2')
md5sums=('e62dd7bc2dd77622cc0987a4dbf9b38c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
