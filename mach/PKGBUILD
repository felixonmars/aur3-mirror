# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=mach
pkgver=0.9.5
pkgrel=1
pkgdesc="mach allows you to set up clean build roots from scratch for any distribution or distribution variation supported."
arch=('i686' 'x86_64')
url="http://thomas.apestaart.org/projects/mach/"
license=('LGPL')
depends=('python' 'rpm' 'yum')
makedepends=('pkgconfig')
source=("http://thomas.apestaart.org/download/$pkgname/$pkgname-$pkgver.tar.gz")
install=$pkgname.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --exec-prefix=/usr --prefix= || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('6f52c0cfb60ce328981feaa869d800be')
