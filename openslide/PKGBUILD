# Maintainer: Denis Grabok <digrabok@gmail.com>
pkgname=openslide
pkgver=3.4.0
pkgrel=1
epoch=
pkgdesc="This library reads whole slide image files (also known as virtual slides)."
arch=('i686' 'x86_64')
url="http://openslide.org/"
license=('LGPL version 2.1')
groups=()
depends=('zlib' 'libpng' 'libjpeg-turbo' 'libtiff' 'openjpeg2>=2.1' 'gdk-pixbuf2' 'libxml2' 'sqlite>=3.6.20' 'cairo>=1.2' 'glib2>=2.16')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/openslide/openslide/releases/download/v3.4.0/openslide-3.4.0.tar.gz")
noextract=()
md5sums=('8fe0e6a0bb97b476de839600604baf4c')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
