# Maintainer: Benoit Brummer <trougnouf@gmail.com>
# Contributor: aus4000 <9aus4000@gmail.com>
basename=libglfps
pkgname=lib32-$basename
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="libglfps adds a framerate display to OpenGL apps that don't have one built in, through the magic of LD_PRELOAD. (Similar to FRAPS on Windows.)"
arch=('x86_64')
url="http://code.fluffytapeworm.com/projects/libglfps"
license=('GPL')
groups=()
depends=('lib32-freeglut' "$basename")
makedepends=()
checkdepends=()
optdepends=()
provides=(lib32-libglfps)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/$basename-$pkgver.tar.gz")
noextract=()
md5sums=("7b4401a24ca90fb5c956760f4db4f907")

build() {

	cd ${srcdir}/${basename}-${pkgver}

	export CC='gcc -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	./configure --prefix=/usr --libdir=/usr/lib32 --disable-static 
	make
}

check() {
	cd ${srcdir}/${basename}-${pkgver}
	make -k check
}

package() {
	cd ${srcdir}/${basename}-${pkgver}
	make DESTDIR=${pkgdir}/ install
	rm ${pkgdir}/usr/bin/glfps
}
