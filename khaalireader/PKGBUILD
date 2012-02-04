# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=khaalireader
pkgver=0.2.6
pkgrel=1
pkgdesc="FB2 (FictionBook2) reader for KDE"
arch=("i686" "x86_64")
url="http://www.khaalireader.narod.ru/"
license=("GPL")
depends=(kdemod-kdelibs)
makedepends=(autoconf)
source=(http://www.khaalireader.narod.ru/files/$pkgname-$pkgver.tar.bz2)
md5sums=('69a623b542960fca8d38dacaf750fcd7')

build() {
	cd $srcdir/$pkgname-$pkgver
	. /etc/profile.d/qt3.sh
	autoconf
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
# vim: ts=2
