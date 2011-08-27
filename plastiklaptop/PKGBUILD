# Contributor: Anton Komonov <komonov@gmail.com>
pkgname=plastiklaptop
pkgver=0.6.1
pkgrel=1
pkgdesc="kwin window decoration with rectangular buttons"
arch=('i686')
url="http://www.kde-look.org/content/show.php?content=34616"
license="GPL"
depends=('kdelibs')
source=(http://kde-look.org/CONTENT/content-files/34616-$pkgname-$pkgver.tar.bz2)
md5sums=('686365e0dfbea44a15d6dd865613cb3c')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
	make || return 1
	make DESTDIR=$startdir/pkg install
}




