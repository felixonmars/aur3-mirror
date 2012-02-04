#contributor: kagan <juanynie@ono.com>

pkgname=nimuh-data
pkgver=1.02
pkgrel=3
pkgdesc="Data files for 'Nimuh: En busca del tesoro andaluz'"
url="http://www.nimuh.com"
license="Creative Commons Attribution-Noncommercial-Share Alike 2.5"
arch=('i686' 'x86_64')
depends=()
makedpends=('pkgconfig')
source=(http://downloads.sourceforge.net/nimuh/$pkgname-$pkgver.tar.gz)
md5sums=('477adb40179b5f5187f02668173e8dc5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
