# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=gsuffix
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="generalized suffix-based algorithms useful for searching for string patterns in sets of input strings"
arch=('x86_64' 'i686')
url="http://gsuffix.sourceforge.net/"
license=('LGPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f77e037c494ed414694225cab8fa833d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
