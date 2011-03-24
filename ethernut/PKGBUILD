pkgname=ethernut
pkgver=4.8.8
pkgrel=0
pkgdesc="Ethernut real time operating system"
arch=(i686 x86_64)
license=('BSD')
depends=()
url="http://www.ethernut.de"
options=()
source=(http://downloads.sourceforge.net/project/ethernut/ethernut/4.8.8%20stable/ethernut-4.8.8.tar.bz2)
md5sums=('9ecd0efe8b6da0c1406aab5fe025af7e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/ethernut
  make || return 1
  make prefix=$startdir/pkg/usr install
}
