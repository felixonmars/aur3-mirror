pkgname=qfaktury
pkgver=0.6.2
_pkgver=${pkgver}_1
pkgrel=1
pkgdesc="Program fakturowy"
url="http://www.e-linux.pl/"
depends=('qt4>=qt4.4')
makedepends=()
conflicts=()
arch=('i686')
license=('GPL')
replaces=()
backup=()

source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$_pkgver.tar.gz")
md5sums=('7959bd451dc75beb47f4ecd08ba84a87')

build() {
	cd $startdir/src/$pkgname-$pkgver
	qmake
	make || return 1
	make DESTDIR=$startdir/pkg install
}