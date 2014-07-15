# Maintainer: Menche <menche_mt at yahoo dot com>

pkgname=minetest-classic-next-git
pkgver=20140714.9985a89
pkgrel=1
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game (experimental branch)"
url="http://minetest-classic.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgl' 'libxxf86vm' 'sqlite')
makedepends=('git' 'cmake' 'irrlicht')
provides=('minetest-classic')
conflicts=()

source=('git+git://gitorious.org/minetest-classic/minetest-classic.git#branch=next')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/minetest-classic"
	git log -1 --date=short --format="%cd.%h" | tr -d -
}

prepare() {
	cd "${srcdir}/minetest-classic"
	git checkout next
}

build() {
	cd "${srcdir}/minetest-classic"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG
	make
}

package() {
	cd "${srcdir}/minetest-classic"
	make DESTDIR="${pkgdir}" install
}
