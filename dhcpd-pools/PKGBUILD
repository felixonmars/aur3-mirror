pkgname=dhcpd-pools
pkgver=2.26
pkgrel=1
pkgdesc="ISC dhcp shared network and pool range usage analysis"
arch=(i686 x86_64)
url="http://dhcpd-pools.sourceforge.net/"
license=('GPL')
depends=()
makedepends=('uthash')
optdepends=('perl')
source=(http://downloads.sourceforge.net/project/dhcpd-pools/$pkgname-$pkgver.tar.xz)
md5sums=('018c42dafdd93d81ef0c10de62583937')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
