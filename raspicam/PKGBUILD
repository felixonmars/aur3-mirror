# Maintainer: Sebastian Frohn <unrath@unterderbruecke.de>
pkgname=raspicam
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="This library allows to use the Raspberry Pi Camera with C++."
arch=('armv6h')
url='http://sourceforge.net/projects/raspicam/?source=navbar'
license=('unknown')
groups=()
depends=()
makedepends=('unzip cmake make gcc')
checkdepends=()
optdepends=('opencv')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://downloads.sourceforge.net/project/raspicam/raspicam-0.1.1.zip'
	raspicam.conf
	)
noextract=()
md5sums=('52e82831dfd80600e5e9976c7e72f2c4'
         'bcdcb23c5d5fb460cee2ce315ef7bd32')

prepare() {
	unzip -o $srcdir/$pkgname-$pkgver.zip
}

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p build
	cd build
	cmake ..
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/build"
#	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -D $srcdir/raspicam.conf $pkgdir/etc/ld.so.conf.d/raspicam.conf
}

