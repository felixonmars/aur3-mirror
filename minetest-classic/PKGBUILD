# Maintainer: Menche <menche_mt at yahoo dot com>

pkgname=minetest-classic
pkgver=1405.01
pkgrel=1
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
url="http://minetest-classic.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgl' 'libxxf86vm' 'sqlite')
makedepends=('cmake' 'irrlicht')
conflicts=('minetest-classic-next-git')

source=("http://minetest-classic.com/downloads/${pkgname}-${pkgver}-src.tar.bz2")

sha256sums=('080920a2c20f0793ef9f3a405cbed8c9890f139d775578fe55f15a50f33e4437')

build() {
	cd "${srcdir}/${pkgname}"

	# server doesn't link currently
	cmake . -DBUILD_SERVER=0 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
