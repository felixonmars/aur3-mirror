pkgname=maatkit
pkgver=5427
pkgrel=1
pkgdesc="Maatkit (formerly MySQL Toolkit) contains essential command-line tools for MySQL, such as table checksums, a query profiler, a visual EXPLAIN tool, and master-slave integrity checking."
url="http://www.maatkit.org/"
arch=('i686' 'x86_64')
license="GPL2"
depends=('perl>=5.8', 'perl-dbd-mysql')
source=(http://maatkit.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('dfbaf5dd700c2eda9f4de162b7ed9c82')
build() {
	cd $startdir/src/$pkgname-$pkgver
	perl Makefile.PL || return 1
	make DESTDIR=$startdir/pkg install
}
