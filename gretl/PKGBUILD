# Maintainer: Gunther Grasshopper <dproduzioni@gmail.com>
# Maintainer: Rachele Grasshopper <rachele@logorroici.org>
# Contributor: Minh Nguyen <manehi@gmail.com>
pkgname=gretl
pkgver=1.9.90
pkgrel=1
pkgdesc="Gnu Regression, Econometrics and Time-series Library"
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
depends=(gtksourceview3 fftw gnuplot curl lapack mpfr unixodbc)
makedepends=(lapack gcc)
optdepends=('libgnomeui: gnome UI integration' 'libgnomeprintui: gnome print integration' 'gtk3: gretl GUI')
options=(!libtool)
source=(http://prdownloads.sourceforge.net/gretl/$pkgname-$pkgver.tar.xz)
md5sums=('e28ddcd8500a45632819a140d0050ad2')

prepare() {
	#cp "$pkgname-$pkgver.patch" "$srcdir/$pkgname-$pkgver/$pkgname-$pkgver.patch"
	cd "$srcdir/$pkgname-$pkgver"
	#patch -p0 < "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	#./configure --prefix=/usr --enable-openmp --with-odbc
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
