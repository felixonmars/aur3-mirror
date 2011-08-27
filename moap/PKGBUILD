# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=moap
pkgver=0.2.7
pkgrel=1
pkgdesc="A swiss army knife for project maintainers and developers."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python')
makedepends=()
source=(http://thomas.apestaart.org/download/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('c016c6822fe619b221ad6eaed7aff4c5')
url="https://thomas.apestaart.org/moap/trac"

build() {
   cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
