# Contributor: d'Ronin <daronin@2600.com>

pkgname='ne7ssh'
pkgver='1.3.2'
pkgrel='1'
pkgdesc='NetSieben SSH Library is a Secure Shell client library written in C++.'
license=('QPL')
arch=('i686' 'x86_64')
url='http://www.netsieben.com/products/ssh/index.phtml'
depends=('libbotan' 'cmake')
install=
source=(http://www.netsieben.com/files/ne7ssh-$pkgver.tar.gz)
md5sums=('0e260adcc0de1646871f3c1876a569a8')

build() {
  cd $startdir/src/ne7ssh-$pkgver
  cmake .
  make || return 1
  make DESTDIR=$startdir/pkg install
}
