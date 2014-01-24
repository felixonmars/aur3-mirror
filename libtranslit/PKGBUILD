pkgname=libtranslit
pkgver=0.0.3
pkgrel=3
pkgdesc="Transliteration library with multiple backends"
arch=('x86' 'x86_64')
url="https://github.com/ueno/libtranslit/"
license=('GPL3')
depends=('m17n-lib' 'icu' 'vala')
makedepends=('gnome-common' 'gtk-doc')
source=(${pkgname}-${pkgver}.tar.gz::${url}archive/$pkgver.tar.gz)
md5sums=('e673a850fd921a6784b35c910db6ef10')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"
	make DESTDIR="$pkgdir/" install
}
