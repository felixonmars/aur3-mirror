# Contributor: Sander Jansen <sander@knology.net>

pkgname=fxsudoku
pkgver=0.5.1
pkgrel=1
pkgdesc="Sudoku Game and Solver"
depends=('fox>=1.6.0' )
source=(http://fifthplanet.net/files/$pkgname-$pkgver.tar.bz2)
url="http://fifthplanet.net"
md5sums=('213c30d4d8bcac4f71d8ed06b389477c')

build() {
	cd $startdir/src/$pkgname-$pkgver

	# Override default flags
	export CFLAGS="-Wall -O2 -pipe -march=i686"
	export CXXFLAGS="-Wall -O2 -pipe -march=i686"

	# Compile
	./gb

	# make sure destination exists
	mkdir -p $startdir/pkg/usr/bin

	# Install
	./gb install --prefix=$startdir/pkg/usr
}
