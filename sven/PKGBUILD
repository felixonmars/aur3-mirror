#Contributor: Serg IanGicher <iangicher@ukr.net>
pkgname=sven
pkgver=0.6
pkgrel=1
pkgdesc="Sven (multimedia keyboard deamon)"
url="http://sven.linux.kiev.ua"
license="GPL"
depends=('gtk2' 'glibc' 'pcre')
makedepends=(pkgconfig)
conflicts=()
replaces=()
backup=()
install=
source=(http://sven.linux.kiev.ua/$pkgname-$pkgver.tar.bz2)
build() {
   cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make  || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('a36476a4356eac6b62510baf31a1c3b2')
