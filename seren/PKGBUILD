# Maintainer: krabador <darkham@email.it>
pkgname=seren
pkgver=0.0.21
pkgrel=2
epoch=
pkgdesc="A simple VoIP program to create conferences from the terminal"
arch=('i686' 'x86_64')
url="http://holdenc.altervista.org/seren/"
license=('GPL3')
groups=()
depends=('alsa-lib' 'opus' 'libogg' 'ncurses' 'gmp')
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
source=("http://holdenc.altervista.org/seren/downloads/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('9a0e31e68c682ea5b45efab86246448b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

