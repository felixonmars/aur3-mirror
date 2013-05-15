# Maintainer: Benoit Brummer <trougnouf@gmail.com>
pkgname=libglfps
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="libglfps adds a framerate display to OpenGL apps that don't have one built in, through the magic of LD_PRELOAD. (Similar to FRAPS on Windows.)"
arch=('i686' 'x86_64')
url="http://code.fluffytapeworm.com/projects/libglfps"
license=('GPL')
groups=()
depends=('freeglut')
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
source=("$url/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=("7b4401a24ca90fb5c956760f4db4f907")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make -k check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir}/ install
}
